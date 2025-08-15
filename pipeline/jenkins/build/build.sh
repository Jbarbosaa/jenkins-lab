#!/bin/bash

# Copy the new jar to the build location
echo "antes do cd"
pwd && ls -ltr

cd /app/target/

echo "dps do cd"
pwd && ls -ltr

cp -f *.jar ./var/jenkins_home/workspace/pipeline-maven/pipeline/jenkins/build/app.jar



echo "*********************************"
echo "**** Building Docker Images *****"
echo "*********************************"

docker compose -f docker-compose-build build --no-cache