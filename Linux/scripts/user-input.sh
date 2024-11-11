#!/bin/bash

count=$1
name=$2

if (( $count >= 40 )) 
then
    echo "The condition is true"
else
    echo "The condition is false"
fi

if [ $name == "usman" ] 
then
    echo "The Name condition is true"
else
    echo "The Name condition is false"
fi