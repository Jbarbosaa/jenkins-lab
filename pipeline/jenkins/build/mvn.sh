#!bin/bash

echo "**************************"
echo "*** Building Jar *********"
echo "**************************"

docker run --rm -v $PWD/java-app:/app -v /root/.m2/:/root/.m2 -w /app maven:3.9.9-eclipse-temurin-21 mvn "$@"
