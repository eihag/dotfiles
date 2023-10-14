#!/usr/bin/env bash

if [ ! -d "$HOME/.local" ]; then
  mkdir $HOME/.local
fi

gh repo list $GITHUB_ORGANIZATION --limit 999 --no-archived --visibility private --json nameWithOwner --jq '.[] | .nameWithOwner' >~/.local/repo-list