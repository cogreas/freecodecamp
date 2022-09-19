#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

OUTPUT() {
  if [[ -z $ELEMENT ]]
  then
    echo "I could not find that element in the database."
  else
    echo "$ELEMENT" | while read TYPE_ID BAR ATOMIC_NUMBER BAR ATOMIC_MASS BAR MELTING BAR BOILING BAR SYMBOL BAR NAME BAR TYPE
    do
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
    done 
  fi
}


if [[ $1 ]]
then
  NUMBERS=$(echo "$1" | awk '/[0-9]/{print $0}')
  if [[ -z $NUMBERS ]]
  then
    SYMBOLS=$(echo $1 | tr -cd "[A-Z][a-z]" | wc -m)
    if [[ $SYMBOLS -lt 3 ]]
    then
      ELEMENT=$($PSQL "SELECT * FROM properties JOIN elements USING (atomic_number) JOIN types USING (type_id) WHERE symbol='$1';")
      OUTPUT
    else
      ELEMENT=$($PSQL "SELECT * FROM properties JOIN elements USING (atomic_number) JOIN types USING (type_id) WHERE name='$1';")
      OUTPUT
    fi
  else
    ELEMENT=$($PSQL "SELECT * FROM properties JOIN elements USING (atomic_number) JOIN types USING (type_id) WHERE atomic_number=$1;")
    OUTPUT
  fi
else
  echo "Please provide an element as an argument."
fi
 