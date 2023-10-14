#!/usr/bin/env bash

repos=`cat ~/.local/repo-list`

if [ -f "/tmp/queued-runs" ]; then
  rm /tmp/queued-runs
fi

if [ -f "/tmp/progress-runs" ]; then
  rm /tmp/progress-runs
fi

for val1 in ${repos}; do
    #echo $val1
    gh --repo $val1 run list --status in_progress --json 'headBranch,createdAt,displayTitle,url' --jq '.[] | [ .createdAt , .url, .displayTitle, .headBranch]|@tsv'>>/tmp/progress-runs &
    gh --repo $val1 run list --status queued --json 'headBranch,createdAt,displayTitle,url' --jq '.[] | [ .createdAt , .url, .displayTitle, .headBranch]|@tsv'>>/tmp/queued-runs &

done
wait

echo `cat /tmp/progress-runs | wc -l` builds in progress:
cat /tmp/progress-runs | sort | column -ts $'\t'
echo
echo `cat /tmp/queued-runs | wc -l` queued builds:
cat /tmp/queued-runs | sort | column -ts $'\t'
