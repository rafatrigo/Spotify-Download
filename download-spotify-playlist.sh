#!/bin/bash

# verify if the number of arguments is greater than 0
if [ $# -eq 0 ]; then
        echo "Error: A parameter is missing!"
        echo "Use: $0 <spotify playlist link> <path>"
        exit 1
fi

if [ $# -eq 1 ]; then
        echo "Error: A parameter is missing!"
        echo "Use: $0 <spotify playlist link> <path>"
        exit 1
fi

LINK="$1"
PATH="$2"

# get the liks of the music on the playlist
./get-musics-in-playlist.sh "$LINK"

# get the title of the music and the name of the artist
# the script below call the get-title-and-artist-from-html script
./generate-title-artist-file.sh music-links.txt

# generate search-links file
./generate-search-links.sh title-artist.txt


# generate music link
# download music
while IFS= read -r link; do

	MUSIC_LINK=$( ./get-yt-music-link.sh "$link" )

	MUSIC_NAME=$( echo "$link" | grep -oP '(?<=query=)(.*?)(?=$)' | sed 's/+/_/g' )

	./download-music.sh "$MUSIC_LINK" "$PATH/$MUSIC_NAME"

	echo "$MUSIC_NAME downloaded."

done < search-links.txt

# delete the files create during the download process
./clear.sh

exit 0
