#!/usr/bin/env bash

for dir in ./*	;
do
  if [ -d "${dir}/.git" ]; then 	
  	cd $dir
  	RESULT+="$dir `git rev-parse --abbrev-ref HEAD`"$'\n'
    cd ..
  fi
done
echo "$RESULT" | column -t