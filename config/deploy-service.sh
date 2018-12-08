#!/bin/bash

Instance="master1"

docker service rm $Instance-config


docker service create \
  --name $Instance-config \
  --replicas 1 \
  --restart-condition none \
  kwening-config-container-base:lts
#  --mount target=/usr/share/ref/cdc/,source=`pwd`/jenkins-home/,type=bind \
#  kwening-config-container-base:lts  
