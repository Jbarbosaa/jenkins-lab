#!/bin/bash

# Copy the new jar to the build location

pwd
cp -f /target/*.jar ./app.jar

echo "*********************************"
echo "**** Building Docker Images *****"
echo "*********************************"

docker compose -f docker-compose-build build --no-cache