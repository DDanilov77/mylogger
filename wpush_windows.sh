#!/bin/bash
git pull origin master

file=".git/new-push.txt"
git status > $file
git add .

if [ -z "$1" ]; then  #if not yet cmd parameters
    var1=0; var2=0; var3=0;
    git commit -m"Commit by ${HOSTNAME}/${USERNAME} at ${DATE}"
else
    #echo "$1";
    git commit -m"$1 : by ${HOSTNAME}/${USERNAME} at ${DATE}";
fi
git push origin master
