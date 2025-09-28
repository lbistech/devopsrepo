#!/bin/bash
#

first_input=$1
second_input=$2

if [ $first_input -gt $second_input ]; then
	echo "$first_input is greater than $second_input"
elif [ $first_input -lt $second_input ]; then
	echo "$second_input is greater than $first_input"
else
	echo "Both numbers are equal"
fi
