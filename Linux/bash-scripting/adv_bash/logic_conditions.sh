#!/bin/bash

Name="Hassan"

if [[ $Name == "Usman" ]]
then
  echo "Your Name is Usman"

elif [[ $Name != "Usman" ]]
then
  echo "Your Name is $Name"

else
  echo "No condition"
fi
