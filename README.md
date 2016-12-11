# music-player

A simple music player that gets songs from Youtube and plays them offline.

## Installation

* Clone the repository with `git clone https://github.com/afuous/music-player`.
* Install [youtube-dl](http://rg3.github.io/youtube-dl/download.html) to download the songs. (`pacman -S youtube-dl` on Arch Linux)
* Optionally, install [mp3gain](http://mp3gain.sourceforge.net/download.php) to set all songs to a consistent volume level. (`pacman -S mp3gain` on Arch Linux)

## Playlists

Songs are organized in playlists. Songs and playlists are managed with the shell. To create a playlist, run `./makelist <name>`, replacing `<name>` with the name for your playlist. You need to create at least one playlist before downloading any songs.

## Downloading songs

First, find the song on Youtube and copy the last part of the URL. For example, if the URL is `https://www.youtube.com/watch?v=8pPvNqOb6RA`, copy the `8pPvNqOb6RA`. Then run `./download <youtube-id> <playlist> <name> <artist>`. For example, `./download 8pPvNqOb6RA rock "Stairway to Heaven" "Led Zeppelin"`. If you forget the order of the arguments, just run `./download` and it will tell you.

## Playing songs

Open `play.html` in your favorite web browser that supports HTML5 and enter the name of the playlist. The songs will be played in a random order, but will not be repeated until each one has been played. To pause/play, press space. To skip to the next song, press the `Next` button or `P` on the keyboard. The slider on the bottom can speed up or slow down the audio.
