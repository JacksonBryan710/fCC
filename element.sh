#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

#if no input
if [[ -z $1 ]]
then
  echo -e "Please provide an element as an argument."
  exit
fi

#if arguement is atomic number
if [[ $1 =~ ^[0-9]+$ ]]
then
  ELEMENT_INFO=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements JOIN properties USING(atomic_number) JOIN types USING(type_id) WHERE atomic_number = '$1'")
#if arguement is name or symbol
else
  ELEMENT_INFO=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements JOIN properties USING(atomic_number) JOIN types USING(type_id) WHERE symbol = '$1' OR name = '$1'")
fi

#Is the element there
if [ -z $ELEMENT_INFO ]
then
  echo -e "I could not find that element in the database."
#The element is there
else
  echo $ELEMENT_INFO | while IFS="|" read NUM NAME SYM TYP AM MPC BPC
  do
    echo -e "The element with atomic number $NUM is $NAME ($SYM). It's a $TYP, with a mass of $AM amu. $NAME has a melting point of $MPC celsius and a boiling point of $BPC celsius."
  done
fi