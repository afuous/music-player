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

	json=$(curl -s "https://d.yt-downloader.org/check.php?v=$video&f=mp3")

	hash=$(echo $json | jq -r ".hash")
	sid=$(echo $json | jq -r ".sid")

	if [ "$sid" == "null" ]; then
		error "Error, perhaps the video does not exist"
	fi

	thing=$(echo "$stuff" | sed "${sid}q;d")

	outfile="files/$list/$(nospaces "$songname")-$(nospaces "$songartist").mp3"

	curl -s "http://$thing.yt-downloader.org/download.php?id=$hash&d=$video" > "$outfile"

	if [[ $(du -sh "$outfile") == 0* ]]; then
		rm "$outfile"
		error "Video service sent no data; find a new video :/"
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

# https://www.youtube2mp3.cc/
read -r -d '' stuff <<EOF
gpkio
agobe
macsn
hcqwb
fgkzc
hmqbu
kyhxj
nwwxj
sbist
ditrj
qypbr
trciw
sjjec
afyzk
ocnuq
qxqnh
kzrzi
obdzo
umbbo
aigkk
qgxhg
fkaph
upajk
xqqqh
xrmrw
fjhlv
ejtbn
urynq
tjljs
ywjkg
EOF

main "$@"
