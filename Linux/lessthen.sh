#!/bin/bash

count=$1

if [[ $count -le 20 ]]
then
        echo "---------------------"
        echo "The condition is true"
else
        echo "----------------------"
        echo "The condition is false"
fi
