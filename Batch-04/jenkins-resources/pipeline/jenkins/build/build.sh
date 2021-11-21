#!/bin/bash

echo "*****************************"
echo "*** BUILDING DOCKER IMAGE ***"
echo "*****************************"

cd jenkins/build/ && docker-compose -f docker-compose-build.yaml build --no-cache
