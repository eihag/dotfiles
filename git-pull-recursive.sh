#!/usr/bin/env bash

for dir in ./*	;
do
  if [ -d "${dir}/.git" ]; then
    cd $dir
    echo git pull $dir
   	git pull
   	cd ..
  fi
done