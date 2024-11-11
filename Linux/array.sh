#!/bin/bash

course=('aws' 'devops' 'linux' 'python' 'gcp')
echo "${course[@]}"

echo "printing values from the index"
echo "${course[0]}"
echo "${course[1]}"
echo "${course[2]}"

echo "${#course[@]}"
