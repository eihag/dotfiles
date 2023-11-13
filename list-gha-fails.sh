#!/usr/bin/env bash

repos=`cat ~/.local/repo-list`

if [ -f "/tmp/fail-runs" ]; then
  rm /tmp/fail-runs
fi
if [ -f "/tmp/fail-runs-1d" ]; then
  rm /tmp/fail-runs-1d
fi

for val1 in ${repos}; do
    #echo $val1
    gh --repo $val1 run list --status failure --created "$(date -v -0d +%F)" --json 'headBranch,createdAt,displayTitle,url' --jq '.[] | [ .createdAt , .url, .displayTitle, .headBranch]|@tsv'>>/tmp/fail-runs &
    gh --repo $val1 run list --status failure --created "$(date -v -1d +%F)" --json 'headBranch,createdAt,displayTitle,url' --jq '.[] | [ .createdAt , .url, .displayTitle, .headBranch]|@tsv'>>/tmp/fail-runs-1d &
done
wait
echo Today:
echo `cat /tmp/fail-runs | wc -l` failed builds:
cat /tmp/fail-runs | sort | column -ts $'\t'
echo
echo Yesterday:
echo `cat /tmp/fail-runs-1d | wc -l` failed builds:
cat /tmp/fail-runs-1d | sort | column -ts $'\t'

