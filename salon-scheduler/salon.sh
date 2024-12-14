#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"
echo -e "Welcome to My Salon, how can I help you?\n"

MAIN_MENU() {
  if [[ $1 ]]; then
    echo -e "\n$1"
  fi

  # service menu
  AVAILABLE_SERVICES=$($PSQL "select service_id, name from services")
  echo "$AVAILABLE_SERVICES" | while read SERVICE_ID BAR SERVICE_NAME; do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done

  read SERVICE_ID_SELECTED
  create_appointment
}

create_appointment() {
  SERVICE_AVAILABILITY=$($PSQL "select service_id from services where service_id = $SERVICE_ID_SELECTED")
  if [[ -z $SERVICE_AVAILABILITY ]]; then
    MAIN_MENU "I could not find that service. What would you like today?"
  else
    SERVICE_NAME=$($PSQL "select name from services where service_id = $SERVICE_ID_SELECTED")
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE
    CUSTOMER_NAME=$($PSQL "select name from customers where phone = '$CUSTOMER_PHONE'")
    if [[ -z $CUSTOMER_NAME ]]; then
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME
      # insert new customer
      INSERT_CUSTOMER_RESULT=$($PSQL "insert into customers(name, phone) values('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
    fi
    CUSTOMER_ID=$($PSQL "select customer_id from customers where phone = '$CUSTOMER_PHONE'")
    echo -e "\nWhat time would you like your cut, $CUSTOMER_NAME?"
    read SERVICE_TIME
    INSERT_SERVICE_RESULT=$($PSQL "insert into appointments(service_id, customer_id, time) values($SERVICE_ID_SELECTED, $CUSTOMER_ID, '$SERVICE_TIME')")
    echo -e "\nI have put you down for a $(echo "$SERVICE_NAME" | sed --regexp-extended 's/^ *| *$//g') at $(echo "$SERVICE_TIME" | sed --regexp-extended 's/^ *| *$//g'), $(echo "$CUSTOMER_NAME" | sed --regexp-extended 's/^ *| *$//g')."
  fi
}

MAIN_MENU
