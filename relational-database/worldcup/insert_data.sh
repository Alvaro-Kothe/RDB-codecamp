#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
get_teamid() {
  team_id="$($PSQL "select team_id from teams where name = '$1'")"
  if [[ -z "$team_id" ]]; then
    result=$($PSQL "insert into teams(name) values('$1')")
    if [[ $result == "INSERT 0 1" ]]; then
      team_id="$($PSQL "select team_id from teams where name = '$1'")"
    fi
  fi
  echo $team_id
}

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ -n $YEAR && $YEAR != "year" ]]; then
    # get winner_id from teams table (create if doesn't exist)
    winner_id=$(get_teamid "$WINNER")
    # get loser_id
    op_id=$(get_teamid "$OPPONENT")
    # insert into games table the match result
    $PSQL "insert into games
      (year, round, winner_id, opponent_id, winner_goals, opponent_goals)
      values($YEAR, '$ROUND', $winner_id, $op_id, $WINNER_GOALS, $OPPONENT_GOALS)"
  fi
done


