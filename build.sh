#!/bin/sh
docker build --rm -f "./node/slim/latest/Dockerfile" -t "$DOCKER_USERNAME/node:slim-latest-$TRAVIS_TAG" "./node/slim/latest"
docker tag "$DOCKER_USERNAME/node:slim-latest-$TRAVIS_TAG" "$DOCKER_USERNAME/node:slim-latest"
docker push $DOCKER_USERNAME/node:slim-latest-$TRAVIS_TAG
docker push $DOCKER_USERNAME/node:slim-latest
docker build --rm -f "./node/slim/latest/Dockerfile" -t "$DOCKER_USERNAME/node:slim-$TRAVIS_TAG" "./node/slim/latest"
docker tag "$DOCKER_USERNAME/node:slim-$TRAVIS_TAG" "$DOCKER_USERNAME/node:slim"
docker push $DOCKER_USERNAME/node:slim-$TRAVIS_TAG
docker push $DOCKER_USERNAME/node:slim
