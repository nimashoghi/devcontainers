#!/bin/bash

docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD

# clojure
docker build --rm -f "./clojure/latest/Dockerfile" -t "$DOCKER_USERNAME/clojure:latest-$TRAVIS_TAG" "./clojure/latest"
docker tag "$DOCKER_USERNAME/clojure:latest-$TRAVIS_TAG" "$DOCKER_USERNAME/clojure:latest"
docker push $DOCKER_USERNAME/clojure:latest-$TRAVIS_TAG
docker push $DOCKER_USERNAME/clojure:latest

# fsharp
docker build --rm -f "./fsharp/latest/Dockerfile" -t "$DOCKER_USERNAME/fsharp:latest-$TRAVIS_TAG" "./fsharp/latest"
docker tag "$DOCKER_USERNAME/fsharp:latest-$TRAVIS_TAG" "$DOCKER_USERNAME/fsharp:latest"
docker push $DOCKER_USERNAME/fsharp:latest-$TRAVIS_TAG
docker push $DOCKER_USERNAME/fsharp:latest
docker build --rm -f "./fsharp/netcoreapp2.2/Dockerfile" -t "$DOCKER_USERNAME/fsharp:netcoreapp2.2-$TRAVIS_TAG" "./fsharp/netcoreapp2.2"
docker tag "$DOCKER_USERNAME/fsharp:netcoreapp2.2-$TRAVIS_TAG" "$DOCKER_USERNAME/fsharp:netcoreapp2.2"
docker push $DOCKER_USERNAME/fsharp:netcoreapp2.2-$TRAVIS_TAG
docker push $DOCKER_USERNAME/fsharp:netcoreapp2.2

# latex
docker build --rm -f "./latex/latest/Dockerfile" -t "$DOCKER_USERNAME/latex:latest-$TRAVIS_TAG" "./latex/latest"
docker tag "$DOCKER_USERNAME/latex:latest-$TRAVIS_TAG" "$DOCKER_USERNAME/latex:latest"
docker push $DOCKER_USERNAME/latex:latest-$TRAVIS_TAG
docker push $DOCKER_USERNAME/latex:latest

# node
docker build --rm -f "./node/current/Dockerfile" -t "$DOCKER_USERNAME/node:current-$TRAVIS_TAG" "./node/current"
docker tag "$DOCKER_USERNAME/node:current-$TRAVIS_TAG" "$DOCKER_USERNAME/node:current"
docker push $DOCKER_USERNAME/node:current-$TRAVIS_TAG
docker push $DOCKER_USERNAME/node:current
docker build --rm -f "./node/latest/Dockerfile" -t "$DOCKER_USERNAME/node:latest-$TRAVIS_TAG" "./node/latest"
docker tag "$DOCKER_USERNAME/node:latest-$TRAVIS_TAG" "$DOCKER_USERNAME/node:latest"
docker push $DOCKER_USERNAME/node:latest-$TRAVIS_TAG
docker push $DOCKER_USERNAME/node:latest
docker build --rm -f "./node/lts/Dockerfile" -t "$DOCKER_USERNAME/node:lts-$TRAVIS_TAG" "./node/lts"
docker tag "$DOCKER_USERNAME/node:lts-$TRAVIS_TAG" "$DOCKER_USERNAME/node:lts"
docker push $DOCKER_USERNAME/node:lts-$TRAVIS_TAG
docker push $DOCKER_USERNAME/node:lts

# python
docker build --rm -f "./python/2.7/Dockerfile" -t "$DOCKER_USERNAME/python:2.7-$TRAVIS_TAG" "./python/2.7"
docker tag "$DOCKER_USERNAME/python:2.7-$TRAVIS_TAG" "$DOCKER_USERNAME/python:2.7"
docker push $DOCKER_USERNAME/python:2.7-$TRAVIS_TAG
docker push $DOCKER_USERNAME/python:2.7
docker build --rm -f "./python/3.7/Dockerfile" -t "$DOCKER_USERNAME/python:3.7-$TRAVIS_TAG" "./python/3.7"
docker tag "$DOCKER_USERNAME/python:3.7-$TRAVIS_TAG" "$DOCKER_USERNAME/python:3.7"
docker push $DOCKER_USERNAME/python:3.7-$TRAVIS_TAG
docker push $DOCKER_USERNAME/python:3.7
docker build --rm -f "./python/latest/Dockerfile" -t "$DOCKER_USERNAME/python:latest-$TRAVIS_TAG" "./python/latest"
docker tag "$DOCKER_USERNAME/python:latest-$TRAVIS_TAG" "$DOCKER_USERNAME/python:latest"
docker push $DOCKER_USERNAME/python:latest-$TRAVIS_TAG
docker push $DOCKER_USERNAME/python:latest

docker logout
