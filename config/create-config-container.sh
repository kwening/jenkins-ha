#!/bin/bash
CONTAINER="master1-config"
docker rm $CONTAINER
docker create -v /usr/share/jenkins/cdc --name $CONTAINER kwening-config-container-base:lts
docker cp default-user.groovy $CONTAINER:/usr/share/jenkins/cdc/init.groovy.d/
docker cp enable-csrf.groovy $CONTAINER:/usr/share/jenkins/cdc/init.groovy.d/
docker cp hardening.groovy $CONTAINER:/usr/share/jenkins/cdc/init.groovy.d/
