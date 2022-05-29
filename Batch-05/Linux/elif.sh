#!/bin/bash

echo "----------------------"
number=$1

if [[ $number -eq 100 ]]
then
        echo "Here we are the number is equal to 100"
        $newnumber = $number + 50
        echo "Now the new value is $newnumber"

elif [[ $number -eq 200 ]]
then
        echo "Here we are the number is equal to 200"
        $newnumber = ($number + 150)
        echo "Now the new value is ${newnumber}"

elif [[ $number -eq 300 ]]
then
        echo "Here we are the number is equal to 300"
        $newnumber = $number - 50
        echo "Now the new value is $newnumber"



else
        echo "There is no match ..."
fi
