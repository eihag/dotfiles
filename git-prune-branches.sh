#!/usr/bin/env bash
git branch --merged master | grep -v "\* master" | xargs -n 1 git branch -d
git remote prune origin