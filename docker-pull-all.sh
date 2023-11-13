#!/usr/bin/env bash
# Get latest of all locally known AWS ECR docker images 
for image in `docker images --format "{{.Repository}}" | sort | uniq | grep ecr`;
do
  docker pull ${image}:latest --quiet
done
