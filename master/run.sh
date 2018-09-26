#!/bin/bash
CONTAINER="jenkins-master1"
docker rm -f $CONTAINER
docker run -p 8080:8080 -d --name $CONTAINER --volumes-from master1-config kwening-jenkins-base:lts
