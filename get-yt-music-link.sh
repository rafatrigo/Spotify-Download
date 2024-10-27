#!/bin/bash

# verify if the number of arguments is greater than 0
if [ $# -eq 0 ]; then
	echo "Error: A parameter is missing!"
	echo "Use: $0 <youtube search link>"
	exit 1
fi

SEARCH_LINK="$1"

PREFIX='"videoRenderer":{"videoId":"'

SEARCH_HTML=$(curl "$1")

MUSIC_URL=$(echo "$SEARCH_HTML" | grep -oP "(?<=$PREFIX)(.*?)(?=\")" | head -n 1 )

echo "https://www.youtube.com/watch?v=""$MUSIC_URL"

exit 0

