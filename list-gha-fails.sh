#!/usr/bin/env bash

repos=`cat ~/.local/repo-list`

if [ -f "/tmp/fail-runs" ]; then
  rm /tmp/fail-runs
fi

for val1 in ${repos}; do
    #echo $val1
    gh --repo $val1 run list --status failure --created "$(date +%F)" --json 'headBranch,createdAt,displayTitle,url' --jq '.[] | [ .createdAt , .url, .displayTitle, .headBranch]|@tsv'>>/tmp/fail-runs &
done
wait

echo `cat /tmp/fail-runs | wc -l` failed builds:
cat /tmp/fail-runs | sort | column -ts $'\t'
