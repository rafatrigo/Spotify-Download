#!/bin/bash

# verify if the number of arguments is greater than 0
if [ $# -eq 0 ]; then
        echo "Error: A parameter is missing!"
        echo "Use: $0 <title-artist file>"
        exit 1
fi

FILE="$1"

# verify if the file exists
if [ ! -f "$FILE" ]; then
        echo "Error: File not found: $FILE"
        exit 1
fi

# read each line and execute the script to generate the youtube search links
while IFS= read -r title; do

	NAME_FORMATED=$(./handle-special-character.sh "$title")

        echo "https://www.youtube.com/results?search_query=$NAME_FORMATED" >> search-links.txt

done < "$FILE"

exit 0
