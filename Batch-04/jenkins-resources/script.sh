#!/bin/bash

FirstName=$1
SecondName=$2
CourseName=$3
BatchNumber=$4
SHOW=$5

if [ "$SHOW" = "true" ];then
	echo "Hello World, from Jenkins to $FirstName $SecondName"
	echo "$FirstName $SecondName Current Date and Time is $(date)"
	echo "I am user: $(whoami)"
	echo "Welcome to the $CourseName course, and your batch number is $BatchNumber"
else
	echo "For the output please select show as true"
fi
