#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

get_userid() {
  user_id=$($PSQL "select user_id from users where name = '$1'")
  # if user doesn't exist, create it and return user_id
  if [[ -z $user_id ]]; then
    _=$($PSQL "insert into users(name) values('$1')")
    user_id=$($PSQL "select user_id from users where name = '$1'")
  fi
  echo $user_id
}

# Retrieves number of games and best game from user
get_user_game_info() {
  echo $($PSQL "select count(*), min(guesses) from games where user_id = '$1'")
}

read_guess() {
  echo $1
  read GUESS
  if [[ ! $GUESS =~ ^[0-9]+$ ]]; then
    read_guess "That is not an integer, guess again:"
  else
    NGUESSES=$(($NGUESSES + 1))
    evaluate_guess $GUESS
  fi
}

evaluate_guess() {
  if [[ $1 -gt $NUMBER ]]; then
    read_guess "It's lower than that, guess again:"
  elif [[ $1 -lt $NUMBER ]]; then
    read_guess "It's higher than that, guess again:"
  else
    echo "You guessed it in $NGUESSES tries. The secret number was $NUMBER. Nice job!"
    _=$($PSQL "insert into games(user_id, guesses) values($USER_ID, $NGUESSES)")
  fi
}

NUMBER=$((1 + $RANDOM % 1000))
NGUESSES=0

echo "Enter your username:"
read username

USER_ID=$(get_userid $username)
IFS="|" read ngames min_guesses <<< $(get_user_game_info $USER_ID)

if [[ $ngames -eq 0 || -z $min_guesses ]]; then
  echo "Welcome, $username! It looks like this is your first time here."
else
  echo "Welcome back, $username! You have played $ngames games, and your best game took $min_guesses guesses."
fi

read_guess "Guess the secret number between 1 and 1000:"
