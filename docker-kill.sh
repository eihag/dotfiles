#!/bin/bash

# Kill all running containers
RUNNING=$(docker ps -q)
if ! [[ -z "$RUNNING" ]]; then
	docker kill $RUNNING
fi

# Delete all stopped containers (including data-only containers)
STOPPED=$(docker ps -a -q)
if ! [[ -z "$STOPPED" ]]; then
	docker rm $STOPPED
fi

# Delete all 'untagged/dangling' (<none>) images
DANGLING=$(docker images -q -f dangling=true)
if ! [[ -z "$DANGLING" ]]; then
	docker rmi $DANGLING
fi