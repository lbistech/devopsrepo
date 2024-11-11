#!/bin/bash

echo "Enter the first person name: "
read firstperson

echo "Enter the second person name: "
read secondperson

if [[ $firstperson == "Usman" || $secondperson == "Ali" ]]
then
	echo "The answer is true"

else
	echo "The answer is false"
fi
