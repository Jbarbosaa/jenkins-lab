#!/bin/bash

# Copy the new jar to the build location

cp -f java-app/target/*jar jenkins/build

echo "*********************************"
echo "**** Building Docker Images *****"
echo "*********************************"

docker compose -f docker-compose-build build --no-cache