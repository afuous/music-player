#!/bin/sh

if [[ $# -lt 1 ]]; then
	>&2 echo "Usage: ./normalize.sh list"
	exit
fi

list="$1"

from="files/${list}"
to="files/${list}-normal"

if [ ! -d "$from" ]; then
	>&2 echo "Files not found"
	exit
fi

rm -rf "$to"
cp -r "$from" "$to"
cd "$to"
mp3gain -r *.mp3
