#!/bin/bash
#
echo "This is the range script"

User_input=$1

if [ $User_input -ge 1 ] && [ $User_input -le 100 ]; then
	echo "The number is between 1 and 100"
else
	echo "The number is outside the range"
fi
