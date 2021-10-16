#!/bin/bash

age=19

if [ "$age" -gt 18 ] && [ "$age" -lt 40 ]
then
	echo "Age is corret"
else
	echo "Age is not corrent"
fi
