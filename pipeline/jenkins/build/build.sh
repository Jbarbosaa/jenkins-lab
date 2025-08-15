#!/bin/bash

# Copy the new jar to the build location

cp -f /app/target/my-app-1.0-SNAPSHOT.jar pipeline/jenkins/build/

echo "*********************************"
echo "**** Building Docker Images *****"
echo "*********************************"

docker compose -f docker-compose-build build --no-cache