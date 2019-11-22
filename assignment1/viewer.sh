#!/bin/bash

if [ $# -eq 1 ]; then
	FILENAME=$1
	EXT=$(echo $FILENAME|grep -P '\.+\w+$' -o)
	FINDPATH=$(find . -name $1)
	if [ $(echo "${#FINDPATH}") -eq 0 ]; then
		echo "$FILENAME is not exist." 1>&2
		exit 1
	fi
	case $EXT in
		.c|.html|.js|.txt|.json|.md) gedit $FINDPATH
		    ;;
		.jpg|.jpeg|.png|.gif|.bmp)
		    eog $FINDPATH
		    ;;
		.pptx|.ppt|.odp|.docx|.doc|.odt|.xlsx|.xls|.ods|.csv)
		    libreoffice $FINDPATH
		    ;;
		.mp4)
		    vlc $FINDPATH
		    ;;
		.pdf)
		    evince $FINDPATH
		    ;;
		*)  echo "Err)$EXT is unseted extension." 1>&2
		    exit 1
	esac
else
	echo "Usage : $0 [filename]" 1>&2
	exit 1
fi

exit 0
