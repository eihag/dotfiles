#!/bin/bash

$( dirname "$0" )/docker-kill.sh

# Delete ALL images
ALL_IMAGES=$(docker images -q)
if ! [[ -z "$ALL_IMAGES" ]]; then
	docker rmi $ALL_IMAGES 
fi

# Remove container image - leaks disk space over time
rm -rf ~/Library/Containers/com.docker.docker/Data/*

osascript -e 'quit app "Docker"'
open --background -a Docker

echo Waiting for Docker to restart...
while ! docker system info > /dev/null 2>&1; do sleep 1; done