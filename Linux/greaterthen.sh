#!/bin/bash

count=$1

if [[ $count > 20 ]]
then
        echo "---------------------"
        echo "The condition is true"
else
        echo "----------------------"
        echo "The condition is false"
fi
