#!/bin/bash

echo "==============================="
echo "=== This is yor Result Card ==="
echo "==============================="

echo "Please Enter Your Marks: "
marks=89

if (( 89 >= 90 ))
then
	echo "Your Grade is A+"

	   1    &&    1 -> 1
elif (( 89 < 90 && 89 >=80 ))
then
	echo "Your Grade is A"
           0          1  -> 0
elif (( 89 < 80 && 89 >=70 ))
then
	echo "Your Grade is B+"
           0          1 -> 0
elif (( 89 < 70 && 89 >= 60 ))
then
	echo "Your Grade is C+"

else
	echo "Your Grade is F"
fi	
