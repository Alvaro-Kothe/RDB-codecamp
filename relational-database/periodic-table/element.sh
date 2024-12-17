#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]; then
  echo "Please provide an element as an argument."
else
  # is number
  if [[ $1 =~ ^[0-9]+$ ]]; then
    QUERY_RESULT=$($PSQL "select atomic_number, symbol, name from elements where atomic_number = $1")
  else
    argsize=${#1}
    if [[ $argsize -le 2 ]]; then
      # is symbol
      QUERY_RESULT=$($PSQL "select atomic_number, symbol, name from elements where symbol = '$1'")
    else
      # is name
      QUERY_RESULT=$($PSQL "select atomic_number, symbol, name from elements where name = '$1'")
    fi
  fi
  if [[ -z $QUERY_RESULT ]]; then
    echo "I could not find that element in the database."
  else
    IFS='|' read -r NUM SYMBOL NAME <<< $QUERY_RESULT
    ELEMENT_PROPERTIES=$($PSQL "select type_id, atomic_mass, melting_point_celsius, boiling_point_celsius from properties where atomic_number = $NUM")
    IFS='|' read -r TYPE_ID MASS MPC BPC <<< $ELEMENT_PROPERTIES
    ELTYPE=$($PSQL "select type from types where type_id = $TYPE_ID")

    echo "The element with atomic number $NUM is $NAME ($SYMBOL). It's a $ELTYPE, with a mass of $MASS amu. $NAME has a melting point of $MPC celsius and a boiling point of $BPC celsius."
  fi
fi
