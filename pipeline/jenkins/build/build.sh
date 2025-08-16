#!/bin/bash

# Copy the new jar to the build location
ls /var/java-app/target/*.jar
cp -f /var/java-app/target/*.jar ./pipeline/jenkins/build/app.jar

echo "*********************************"
echo "**** Building Docker Images *****"
echo "*********************************"

ls -R pipeline/
docker compose -f pipeline/jenkins/build/docker-compose-build.yaml build --no-cache