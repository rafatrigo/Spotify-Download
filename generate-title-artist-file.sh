#!/bin/bash

# verify if the number of arguments is greater than 0
if [ $# -eq 0 ]; then
        echo "Error: A patameter is missing!"
        echo "Use: $0 <music links file>"
        exit 1
fi

MUSIC_LINKS="$1"

# verify if the file exists
if [ ! -f "$MUSIC_LINKS" ]; then
        echo "Error: File not found: $MUSIC_LINKS"
        exit 1
fi

# read each line and execute the script to extract titles and artist
while IFS= read -r link; do

	curl "$link" > music.html

	./get-title-and-artist-from-html.sh music.html >> title-artist.txt

done < "$MUSIC_LINKS"

rm music.html

exit 0
