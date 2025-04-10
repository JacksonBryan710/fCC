#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo -e "\n~~~~ Number Guessing Game ~~~~\n"

MAIN_MENU() {
  #get username
  echo "Enter your username:"
  read USERNAME

  #get user_id
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE name = '$USERNAME'")

  #if user doesn't exist
  if [[ -z $USER_ID ]]
  then
    echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."

    #add new user to database
    INSERT_TO_USER_RESULT=$($PSQL "INSERT INTO users(name) VALUES('$USERNAME')")
    #get new user_id
    USER_ID=$($PSQL "SELECT user_id FROM users WHERE name = '$USERNAME'")

  #if user exists
  else
    #get user info
    GAMES_PLAYED=$($PSQL "SELECT count(user_id) FROM games WHERE user_id = '$USER_ID'")
    BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM games WHERE user_id = '$USER_ID'")

    echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  fi

  NUMBER_GUESS
}

NUMBER_GUESS() {
  #generate random number
  NUMBER=$(($RANDOM%1000 +1))

  #initialize guess count
  GUESSES=0

  #initialize check for if number has been guessed
  GUESSED=0

  echo -e "\nGuess the secret number between 1 and 1000:"

  #play the game
  while [[ $GUESSED = 0 ]];
  do
    read GUESS

    #if not a number
    if [[ ! $GUESS =~ ^[0-9]+$ ]];
    then
      echo -e "\nThat is not an integer, guess again:"
    
    #if value is greater than guess
    elif [[ $NUMBER -gt $GUESS ]];
    then
      GUESSES=$(($GUESSES + 1))
      echo -e "\nIt's higher than that, guess again:"

    #if value is less than guess
    elif [[ $NUMBER -lt $GUESS ]];
    then
      GUESSES=$(($GUESSES + 1))
      echo -e "\nIt's lower than that, guess again:"
      
    #if guess is correct
    else
      GUESSES=$(($GUESSES + 1))
      echo -e "\nYou guessed it in $GUESSES tries. The secret number was $NUMBER. Nice job!"

      #add game to databae
      GAME_INSERT_RESULT=$($PSQL "INSERT INTO games(guesses, user_id) VALUES($GUESSES,$USER_ID)")
      #exit loop
      GUESSED=1
    fi
  done
}

MAIN_MENU
