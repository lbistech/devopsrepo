#!/bin/bash

count=29

if [ $count -eq 20 ]
then
	echo "The condition is true"
else
	echo "The condition is false"
fi

if (( $count >= 30 ))
then
	echo "The second condition is true"
else
	echo "The second condition is false"
fi

if (( $count <= 30 ))
then
        echo "The second condition is true"
else
        echo "The second condition is false"
fi



#eq equal to
#nq not equal to
#gt greater then
#lt less then

#==
#!=
#>
#<
#<=
#>=
