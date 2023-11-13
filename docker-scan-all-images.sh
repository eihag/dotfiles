#!/usr/bin/env bash
# brew install trivy xmlstarlet
# Vulnerability scan of all locally known AWS ECR docker images 

xmlstarlet sel -t -v "//*[local-name()='cve']" -n ~/projects/reepay-build-tool/src/main/resources/reepay-build-tool/dependency-check-ignore.xml>~/.trivyignore

for val1 in `docker images --format "{{.Repository}}" | sort | uniq | grep ecr`; do
     trivy image --quiet  --ignorefile ~/.trivyignore $val1:latest
done
