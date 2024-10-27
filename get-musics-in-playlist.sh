#!/bin/bash

# verify if has URL

if [ -z "$1" ]; then
	
	echo "Error: URL not found"
	echo "Use: $0 <Playlist URL>"
	exit 1

fi

URL="$1"
SEARCH_FOR='<meta name="music:song" content="'
OUTPUT_FILE="music-links.txt"


# make a GET requisition on the URL and get the music links

curl "$URL" | grep -oP "$SEARCH_FOR"'\K[^"]+' >> "$OUTPUT_FILE"

exit 0
