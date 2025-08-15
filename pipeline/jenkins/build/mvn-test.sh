#!/bin/bash

# Testing the .jar

cp -f java-app/target/*jar jenkins/build

echo "*********************************"
echo "**** Testing the code *****"
echo "*********************************"

docker run --rm -v $PWD/java-app:/app -v /root/.m2/:/root/.m2 -w /app maven:3.9.9-eclipse-temurin-21 "$@"
