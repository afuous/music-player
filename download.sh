#!/bin/sh

main() {

	if [[ $# -lt 4 ]]; then
		error "Usage: ./download.sh youtubeid list songname songartist"
	fi

	video="$1"
	list="$2"
	songname="$3"
	songartist="$4"

	if [ ! -d "files/$list" ] || [ ! -f "lists/$list.js" ]; then
		error "List files not found. Please run makelist first or fix the files if you were messing with them."
	fi

	outfile="files/$list/$(nospaces "$songname")-$(nospaces "$songartist").webm"

	youtube-dl -x --audio-format mp3 -o "$outfile" "https://www.youtube.com/watch?v=$video"

	if which mp3gain > /dev/null 2> /dev/null; then
		mp3gain -r "$outfile"
	else
		echo "mp3gain not found; skipping"
	fi

	outjson="{$(quoted name): $(quoted "$songname"), $(quoted artist): $(quoted "$songartist"), $(quoted url): $(quoted "$video")},"
	sed -i "s/]/\t${outjson}\n]/" "lists/$list.js"

}

error() {
	>&2 echo "$1"
	exit
}

nospaces() {
	echo "$1" | sed 's/\s\+//g'
}

quoted() {
	echo '"'"$1"'"'
}

main "$@"
