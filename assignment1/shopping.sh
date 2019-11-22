#!/bin/bash

if [ $# -lt 1 ]; then
	echo "Usage: $(basename $0) [num] [file]" >&2
	exit 1
fi

args=( "$@" )
NUMOFFILE=`expr $# - 1`

i=0
while [ $i -lt $1 ]; do
	target=`expr $i % $NUMOFFILE "+" 1`
	./viewer.sh ${args[$target]} &
	let "i += 1"
done
