#!/usr/bin/env bash
for dir in ./*	;
do
  if [ -d "${dir}/.git" ]; then
    cd $dir
    echo $dir `git rev-parse --abbrev-ref HEAD` | column -t
    git status -s  
    cd ..
  fi
done

