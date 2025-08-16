#!/bin/bash

# Copy the new jar to the build location
ls /var/java-app/target/*.jar
cp -f /var/java-app/target/*.jar ./pipeline/jenkins/build/app.jar

echo "*********************************"
echo "**** Building Docker Images *****"
echo "*********************************"

locate docker-compose-build
docker compose -f /var/jenkins_home/pipeline/jenkins/build/docker-compose-build build --no-cache