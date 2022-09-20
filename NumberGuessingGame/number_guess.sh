#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=games -t --no-align -c"
secret_number=$(($(($RANDOM%1000))+1))
suggest=0
number_of_guesses=0
echo "Enter your username:"
read USER
PROFILE=$($PSQL "SELECT * FROM users WHERE username='$USER'")
if [[ -z $PROFILE ]]
then
  echo "Welcome, $USER! It looks like this is your first time here."
  d=$($PSQL "INSERT INTO users(username) VALUES('$USER')")
else
  echo "$PROFILE" | while IFS="|" read user_id name games_played best_game
    do
      echo "Welcome back, $name! You have played $games_played games, and your best game took $best_game guesses."
    done 
fi
echo "Guess the secret number between 1 and 1000:"
while (( $suggest != $secret_number ))
do
  read suggest
  if [[ $suggest =~ [0-9] ]]
  then 
    number_of_guesses=$(($number_of_guesses+1))
    if (( $suggest < $secret_number ))
    then
      echo "It's higher than that, guess again:"
    elif (( $suggest > $secret_number ))
    then
      echo "It's lower than that, guess again:"
    else
      echo "You guessed it in $number_of_guesses tries. The secret number was $secret_number. Nice job!"
    fi
  else
    echo "That is not an integer, guess again:"
  fi
done
echo "$PROFILE" | while IFS="|" read user_id name games_played best_game
  do
  games_played=$(($games_played+1))
  if [[ -z $best_game ]]
  then
    c=$($PSQL "UPDATE users SET best_game=$number_of_guesses, games_played=$games_played WHERE username='$USER'")
  fi
  if [[ $number_of_guesses -lt $best_game ]]
  then
    a=$($PSQL "UPDATE users SET best_game=$number_of_guesses, games_played=$games_played WHERE username='$USER'")
  else
    b=$($PSQL "UPDATE users SET games_played=$games_played WHERE username='$USER'")
  fi
done 