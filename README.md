# Download musics from spotify

These are a couple of bash scrips that I made to download musics from spotify (it download from youtube the musics of a spotify playlist).

### How to use

Install the dependecies:

- yt-dlp
- ffmpeg

Run the **download-spotify-playlist.sh** script passing the 'playlist URL' and 'path' where you want to save the playlist.
```
./download-spotify-playlist.sh <playlist url> <path>
```

### OBS

That's not the best way to download musics from spotify, you can make it much more simple just using 'yt-dlp' to search and dowload the music. I used it only to download.

The real purpose of this project was to practice some **bash** and work a litle with **regular expressions**.

### Fix

Actually download at most 30 musics, because is the amount that the spotify site load on the start.
