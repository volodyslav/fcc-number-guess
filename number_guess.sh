#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=players -t --no-align -c"
echo -e "\n~~~ Guess Game ~~~\n"
echo "Enter your username:"
read PLAYER_NAME
FIND_NAME=$($PSQL "select username from players where username='$PLAYER_NAME'")
if [[ -z $FIND_NAME ]]
then
  INSERT_USERNAME=$($PSQL "insert into players(username) values('$PLAYER_NAME')")
  echo "Welcome, $PLAYER_NAME! It looks like this is your first time here."
else
  GAME_PLAYED=$($PSQL "select count(games.game_id) from games full join players using(player_id) where players.username='$PLAYER_NAME'")
  BEST_GAME=$($PSQL "select min(games.guesses) from games full join players using(player_id) where username='$PLAYER_NAME'")
  echo "Welcome back, $FIND_NAME! You have played $GAME_PLAYED games, and your best game took $BEST_GAME guesses."
fi

RANDOM_NUMBER=$(($RANDOM % 1000+1))
echo -e "\nGuess the secret number between 1 and 1000:"
read NUMBER
GUESSES=0
while [[ $NUMBER -ne $RANDOM_NUMBER ]]
  do
    if ! [[ $NUMBER =~ ^[0-9]+$ ]]
    then
      echo -e "\nThat is not an integer, guess again:"
    elif [[ $NUMBER -gt $RANDOM_NUMBER ]]
    then
      echo -e "\nIt's higher than that, guess again:"
    elif [[ $NUMBER -lt $RANDOM_NUMBER ]]
    then
      echo -e "\nIt's lower than that, guess again:"
    fi
    read NUMBER
    ((GUESSES++))
  done
((GUESSES++))
echo -e "\nYou guessed it in $GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"
PLAYER_ID=$($PSQL "select player_id from players where username='$PLAYER_NAME'")
INSERT_GAME_PLAYER=$($PSQL "insert into games(guesses, player_id) values($GUESSES, $PLAYER_ID)")
