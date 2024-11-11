#!/bin/bash

age=$1

if [[ $age -eq 55 ]] && [[ $age -gt 40 ]]
then
        echo "Age is correct ..."
else
        echo "Age is not correct ..."
fi
