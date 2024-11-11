#!/bin/bash

firstname="Omar"
secondname="Zafar"
currentdate=`date`

echo "===========================" >> /tmp/output.txt
echo "My First Name is $firstname" >> /tmp/output.txt
echo "My Second Name is $secondname" >> /tmp/output.txt
echo "Current date and time is ${currentdate}" >> /tmp/output.txt
echo "===========================" >> /tmp/output.txt