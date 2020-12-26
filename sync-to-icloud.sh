#!/usr/bin/env bash

if [ -z "$1" ]; then
    echo "Must supply at least one projects directory name as argument"
    exit
fi

DIRS=
for dir in "$@"; do
	if [ -d $HOME/projects/$dir ]; then 	
		DIRS="$DIRS $HOME/projects/$dir"
	else
	    echo "Directory $HOME/projects/$dir does not exist"
	    exit
	fi 
done

echo Copying $DIRS to icloud directory

rsync --stats -a -h $DIRS "$HOME/Library/Mobile Documents/com~apple~CloudDocs/sync-projects-$(date '+%Y-%m-%dT%H:%M:%S')"