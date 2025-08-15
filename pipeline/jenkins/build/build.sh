#!/bin/bash

# Copy the new jar to the build location
echo "antes do cd"
pwd

cd /home/jenkins/jenkins-data/pipeline/java-app/target/
echo "dps do cd"
pwd

cp -f *.jar ./app.jar

echo "*********************************"
echo "**** Building Docker Images *****"
echo "*********************************"

docker compose -f docker-compose-build build --no-cache