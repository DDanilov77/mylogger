#!/bin/bash
CNAME="mylogger"
ver=$(cat version)	&&	echo "Version:$ver"
docker build -t $CNAME:$ver .
docker rmi $(docker images | grep "none" | awk '{print $3}')
docker images | grep "$CNAME"

DNAME="$CNAME-$ver" && echo "DNAME="$DNAME
docker run --name $DNAME --rm -d $CNAME:$ver
sleep 2
echo $(docker ps -a | grep $DNAME | awk '{print $1}')
docker logs -f $(docker ps -a | grep "$DNAME" | awk '{print $1}')
