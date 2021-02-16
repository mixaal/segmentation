#!/bin/bash -e

DIR="$1"
MASK="$2"
if [ -z "$DIR" ]; then
	echo "No image directory given!"
	exit 1
fi

if [ -z "$MASK" ]; then
	echo "No masks directory given!"
	exit 1
fi

set -x

for f in $DIR/*; do
	base=$(basename "$f" | sed -e 's/\..*$//')
	padded=$(printf "%05d"  ${base} )
	target=$(find $MASK -name "*${padded}_nose*")
	echo "${f}, ${target}"
done
