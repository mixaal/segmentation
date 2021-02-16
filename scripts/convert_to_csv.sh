#!/bin/bash -e

FILE="$1"

if [ -z "$FILE" ]; then
	echo "No file given!"
	exit 1
fi

set -x
tail +2 "$FILE" | sed 's/[ ]\+/,/g' 
