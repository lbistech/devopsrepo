#!/bin/bash

echo "==============================="
echo "=== This is yor Result Card ==="
echo "==============================="

echo "Please Enter Your Marks: "
read marks

if (( $marks >= 90 ))
then
	echo "Your Grade is A+"

elif (( $marks < 90 && $marks >=80 ))
then
	echo "Your Grade is A"

elif (( $marks < 80 && $marks >=70 ))
then
	echo "Your Grade is B+"

elif (( $marks < 70 && $marks >= 60 ))
then
	echo "Your Grade is C+"

else
	echo "Your Grade is F"
fi	
