#!/bin/bash

echo maven-project > /tmp/.env
echo $BUILD_TAG > /tmp/.env
echo $pass > /tmp/.env

sed -i '1s/^/IMAGE=/' /tmp/.env
sed -i '2s/^/TAG=/' /tmp/.env
sed -i '3s/^/pass=/' /tmp/.env

KEYDIRECTORY=/var/jenkins_home/.ssh/prod

scp -i $KEYDIRECTORY /tmp/.env prod-user@54.207.139.47:/tmp/.env
scp -i $KEYDIRECTORY pipeline/jenkins/deploy/docker-compose.yml prod-user@54.207.139.47:/tmp/docker-compose.yml

#ssh -i $KEYDIRECTORY prod-user@54.207.139.47 './tmp/publish.sh'

ssh -i $KEYDIRECTORY prod-user@54.207.139.47 'cd /tmp && docker-compose up -d'