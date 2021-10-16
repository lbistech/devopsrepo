#!/bin/bash

number=10
while (( $number <= 100 ))
do
	echo "$number"
	number=$(( $number+1 ))
done
