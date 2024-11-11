#!/bin/bash

echo "Enter starting point: "
read st1

echo "Enter ending point: "
read st2

for i in { "$st1".."$st2" }
do 
	echo $i
done
