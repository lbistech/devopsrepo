#!/bin/bash

echo "Enter the First person name: "
read firstperson
echo "Enter the Second person name: "
read secondperson

if [[ $firstperson == "Usman" || $secondperson == "Ali" ]]; then
    echo "You have won the prize"
else
    echo "Try for the next time"
fi