#!/bin/bash

Names=("Hassan" "Usman" "Hanan")

for Name in "${Names[@]}"; do
  if [[ $Name == "Usman" ]]
  then
    echo "Your Name is Usman"

  elif [[ $Name == "Hassan" ]]
  then
    echo "Your Name is $Name"

  else
    echo "No condition"
  fi
done
