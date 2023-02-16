#!/usr/bin/env bash
# https://github.com/casperdcl/git-fame
for dir in ./*	;
do
  if [ -d "${dir}/.git" ]; then
    cd $dir
    echo $dir
    git fame
    cd ..
  fi
done

