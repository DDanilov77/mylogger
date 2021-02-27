#!/bin/bash
git pull

file=".git/new-push.txt"
git status > $file
git add .

if [ -z "$1" ]; then  #if not yet cmd parameters
    git commit -m"Commit by ${HOSTNAME}/${USERNAME} at ${DATE}"
else
    git commit -m"$1 : by ${HOSTNAME}/${USERNAME} at ${DATE}";
fi
git push
