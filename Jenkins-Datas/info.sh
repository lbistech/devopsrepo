#!/bin/bash

FirstName=Usman
SecondName=Ahmad

echo "Hello World, from Jenkins to $FirstName $SecondName"
echo "$FirstName $SecondName Current Date and Time is $(date)" > /tmp/info2.txt
echo "I am user: $(whoami)"
