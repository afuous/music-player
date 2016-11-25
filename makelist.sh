#!/bin/sh

if [[ $# -lt 1 ]]; then
	>&2 echo "Usage: ./makelist.sh list"
	exit
fi

list="$1"

if [ -d "files/$list" ] || [ -f "lists/$list.js" ]; then
	>&2 echo "List files already exist"
	exit
fi

mkdir -p lists
mkdir -p "files/$list"

cat << EOF > "lists/$list.js"
var songs = [
]
EOF
