#!/bin/sh

docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD

# fsharp
docker build --rm -f "./fsharp/latest/Dockerfile" -t "$DOCKER_USERNAME/fsharp:latest-$TRAVIS_TAG" "./fsharp/latest"
docker tag "$DOCKER_USERNAME/fsharp:latest-$TRAVIS_TAG" "$DOCKER_USERNAME/fsharp:latest"
docker push $DOCKER_USERNAME/fsharp:latest-$TRAVIS_TAG
docker push $DOCKER_USERNAME/fsharp:latest

# node
docker build --rm -f "./node/alpine/Dockerfile" -t "$DOCKER_USERNAME/node:alpine-$TRAVIS_TAG" "./node/alpine"
docker tag "$DOCKER_USERNAME/node:alpine-$TRAVIS_TAG" "$DOCKER_USERNAME/node:alpine"
docker push $DOCKER_USERNAME/node:alpine-$TRAVIS_TAG
docker push $DOCKER_USERNAME/node:alpine
docker build --rm -f "./node/alpine/Dockerfile" -t "$DOCKER_USERNAME/node:latest-$TRAVIS_TAG" "./node/alpine"
docker tag "$DOCKER_USERNAME/node:latest-$TRAVIS_TAG" "$DOCKER_USERNAME/node:latest"
docker push $DOCKER_USERNAME/node:latest-$TRAVIS_TAG
docker push $DOCKER_USERNAME/node:latest
docker build --rm -f "./node/slim/Dockerfile" -t "$DOCKER_USERNAME/node:slim-$TRAVIS_TAG" "./node/slim"
docker tag "$DOCKER_USERNAME/node:slim-$TRAVIS_TAG" "$DOCKER_USERNAME/node:slim"
docker push $DOCKER_USERNAME/node:slim-$TRAVIS_TAG
docker push $DOCKER_USERNAME/node:slim

# clojure
docker build --rm -f "./clojure/latest/Dockerfile" -t "$DOCKER_USERNAME/clojure:latest-$TRAVIS_TAG" "./clojure/latest"
docker tag "$DOCKER_USERNAME/clojure:latest-$TRAVIS_TAG" "$DOCKER_USERNAME/clojure:latest"
docker push $DOCKER_USERNAME/clojure:latest-$TRAVIS_TAG
docker push $DOCKER_USERNAME/clojure:latest

# latex
docker build --rm -f "./latex/latest/Dockerfile" -t "$DOCKER_USERNAME/latex:latest-$TRAVIS_TAG" "./latex/latest"
docker tag "$DOCKER_USERNAME/latex:latest-$TRAVIS_TAG" "$DOCKER_USERNAME/latex:latest"
docker push $DOCKER_USERNAME/latex:latest-$TRAVIS_TAG
docker push $DOCKER_USERNAME/latex:latest

# scripts

# assets

# python
docker build --rm -f "./python/alpine/Dockerfile" -t "$DOCKER_USERNAME/python:alpine-$TRAVIS_TAG" "./python/alpine"
docker tag "$DOCKER_USERNAME/python:alpine-$TRAVIS_TAG" "$DOCKER_USERNAME/python:alpine"
docker push $DOCKER_USERNAME/python:alpine-$TRAVIS_TAG
docker push $DOCKER_USERNAME/python:alpine
docker build --rm -f "./python/alpine/Dockerfile" -t "$DOCKER_USERNAME/python:latest-$TRAVIS_TAG" "./python/alpine"
docker tag "$DOCKER_USERNAME/python:latest-$TRAVIS_TAG" "$DOCKER_USERNAME/python:latest"
docker push $DOCKER_USERNAME/python:latest-$TRAVIS_TAG
docker push $DOCKER_USERNAME/python:latest
docker build --rm -f "./python/slim/Dockerfile" -t "$DOCKER_USERNAME/python:slim-$TRAVIS_TAG" "./python/slim"
docker tag "$DOCKER_USERNAME/python:slim-$TRAVIS_TAG" "$DOCKER_USERNAME/python:slim"
docker push $DOCKER_USERNAME/python:slim-$TRAVIS_TAG
docker push $DOCKER_USERNAME/python:slim

docker logout

