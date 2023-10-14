#!/usr/bin/env bash
git branch --merged main | grep -v "\* main" | xargs -n 1 git branch -d
git remote prune origin