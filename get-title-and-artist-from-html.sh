#!/bin/bash

# verify if the number of arguments is greater than 0
if [ $# -eq 0 ]; then
	echo "Error: A parameter is missing!"
    	echo "Use: $0 <music html text>"
    	exit 1
fi

MUSIC_HTML="$1"

# verify if the file exists
if [ ! -f "$MUSIC_HTML" ]; then
    	echo "Error: File not found: $MUSIC_HTML"
	exit 1
fi

STRING=$(grep -oP '(?<=<title>)(.*?)(?=</title>)' "$MUSIC_HTML")

TITLE=$(echo "$STRING" | grep -oP '(\A)(.*?)(?=\s*-)')

ARTIST=$(echo "$STRING" | grep -oP '(?<=by\s)(.*?)(?=\s*\|)')

echo $TITLE' '$ARTIST

exit 0
