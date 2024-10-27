#!/bin/bash


# verify if the number of arguments is grater than 0
if [ $# -eq 0 ]; then
	echo "Error: A parameter is missing!"
	echo "Use: $0 <string>"
	exit 1
fi

STRING="$1"

####### handle '

STRING=$(echo "$STRING" | sed "s/'/%27/g")
STRING=$(echo "$STRING" | sed 's/&#x27;/%27/g')


###### handle &

STRING=$(echo "$STRING" | sed 's/&amp;/%26/g')
STRING=$(echo "$STRING" | sed 's/&/%26/g')


##### handle (space)

STRING=$(echo "$STRING" | sed 's/ /+/g')

echo "$STRING"

exit 0
