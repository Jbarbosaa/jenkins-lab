#!/bin/bash

# Copy the new jar to the build location

cp -f /home/jenkins/jenkins-data/pipeline/java-app/target/*.jar ./app.jar

echo "*********************************"
echo "**** Building Docker Images *****"
echo "*********************************"

docker compose -f docker-compose-build build --no-cache