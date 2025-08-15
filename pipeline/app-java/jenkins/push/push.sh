#!/bin/bash

echo "*********************"
echo "*** Pushing image ***"
echo "*********************"

IMAGE="maven-project"

echo "** Logging in **"
docker login -u jbarbosaa -p $pass

echo "** Tagging image **"
docker tag $IMAGE:$BUILD_TAG jbarbosaa/$IMAGE:$BUILD_TAG

echo "** Pushing image **"
docker push jbarbosaa/$IMAGE:$BUILD_TAG