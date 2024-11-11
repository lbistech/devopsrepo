#!/bin/bash

count=70

if (( $count == 50 ))
then
  echo "The count value is equal to 50"

elif (( $count > 200 ))
then
  echo "The count value is greater than 200"
 
elif (( $count >= 100 ))
then
  echo "The count value is greater than or equal to 100"

elif (( $count != 50 ))
then
  echo "The count value is not equal to 50"

else
  echo "No condition is true"
fi
