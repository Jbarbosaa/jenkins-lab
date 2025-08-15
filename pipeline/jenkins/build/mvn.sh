#!bin/bash


echo "**************************"
echo "*** Building Jar *********"
echo "**************************"

pwd

docker run --rm -v /home/jenkins/jenkins-data/pipeline/java-app:/app -v /root/.m2/:/root/.m2 -w /app maven:3.9.9-eclipse-temurin-21 mvn "$@"
