#!/bin/bash

REPO="docker-jekyll"
MOUNT="$PWD:/opt/jekyll"
HOST_PORT=4000
CONTAINER_PORT=4000

# Build
docker build -rm -t $REPO .

# Run
docker run -p $HOST_PORT:$CONTAINER_PORT -v $MOUNT -i -t $REPO

# Remove stopped containers
CONTAINERS=$(docker ps  -a | grep 'Exit' | awk '{print $1}')
if [[ -n $CONTAINERS ]]; then
    docker rm $CONTAINERS
fi

# Remove untagged images
IMAGES=$(docker images | grep "^<none>" | awk '{print $3}')
if [[ -n $IMAGES ]]; then
    docker rmi $IMAGES
fi
