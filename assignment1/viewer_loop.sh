#!/bin/bash

while true; do
	read -p "Input File Name (EXIT input 'q')>" FILENAME
	if [ $FILENAME == 'q' ]; then
		break
	fi
	
	./viewer.sh $FILENAME
done

exit 0
