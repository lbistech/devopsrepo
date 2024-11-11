#!/bin/bash

echo "This is the Multiple conditions script"
#marks=$1
echo "Please enter your marks: "
read marks

if (( $marks >= 90 )); then
    echo "Your Grade is A+"
elif (( $marks < 90 && $marks >= 80 )); then
    echo "Your Grade is A"
elif (( $marks < 80 && $marks >= 70 )); then
    echo "Your Grade is B+"
elif (( $marks < 70 && $marks >= 60 )); then
    echo "Your Grade is C+"
else
    echo "Your Grade is F"
fi
