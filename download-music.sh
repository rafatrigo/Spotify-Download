#!/bin/bash

# verify if the number of arguments is greater than 0
if [ $# -eq 0 ]; then
        echo "Error: A parameter is missing!"
        echo "Use: $0 <youtube music link> <music name>"
        exit 1
fi

if [ $# -eq 1 ]; then
        echo "Error: A parameter is missing!"
        echo "Use: $0 <youtube music link> <music name>"
        exit 1
fi

MUSIC_LINK="$1"
MUSIC_NAME="$2"

yt-dlp -x --audio-format mp3 --audio-quality 0 -o "$MUSIC_NAME".mp3 "$MUSIC_LINK"

exit 0
