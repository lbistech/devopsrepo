#!/bin/bash

age=50

if [ "$age" -eq 18 ] || [ "$age" -lt 40 ]
then
	echo "Age is corret"
else
	echo "Age is not corrent"
fi
