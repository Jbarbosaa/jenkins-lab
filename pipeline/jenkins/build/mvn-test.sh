#!/bin/bash

# Testing the .jar

cp -f /var/java-app/target/*.jar ./pipeline/jenkins/build/app.jar

echo "*********************************"
echo "**** Testing the code *****"
echo "*********************************"

docker run --rm -v /home/jenkins/jenkins-data/pipeline/java-app:/app -v /root/.m2/:/root/.m2 -w /app maven:3.9.9-eclipse-temurin-21 mvn "$@"

#WORKSPACE=/home/jenkins/jenkins-data/jenkins_home/workspace/pipeline-maven
#docker run --rm -v $WORKSPACE/java-app:/app -v /root/.m2/:/root/.m2 -w /app maven:3.9.9-eclipse-temurin-21 "$@"
