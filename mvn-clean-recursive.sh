#!/usr/bin/env bash

for dir in ./*	;
do
  if [ -d "${dir}" ]; then 	
    cd $dir
    if [ -f pom.xml ]; then
      echo mvn clean $dir
      mvn clean
    fi
    cd ..
  fi
done