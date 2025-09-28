#!/bin/bash
#
echo "--- User Input ---"
User_input=$1

if [ $User_input -gt 10 ]; then
	echo "Number is greater than 10"
elif [ $User_input -lt 10 ]; then
	echo "Number is less than 10"
else
	echo "There is no match"
fi
