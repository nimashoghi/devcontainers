#!/bin/sh

docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD

# rust
docker build --rm -f "./rust/latest/Dockerfile" -t "$DOCKER_USERNAME/rust:latest-$TRAVIS_TAG" "./rust/latest"
docker tag "$DOCKER_USERNAME/rust:latest-$TRAVIS_TAG" "$DOCKER_USERNAME/rust:latest"
docker push $DOCKER_USERNAME/rust:latest-$TRAVIS_TAG
docker push $DOCKER_USERNAME/rust:latest

# cpp
docker build --rm -f "./cpp/latest/Dockerfile" -t "$DOCKER_USERNAME/cpp:latest-$TRAVIS_TAG" "./cpp/latest"
docker tag "$DOCKER_USERNAME/cpp:latest-$TRAVIS_TAG" "$DOCKER_USERNAME/cpp:latest"
docker push $DOCKER_USERNAME/cpp:latest-$TRAVIS_TAG
docker push $DOCKER_USERNAME/cpp:latest

# react-native
docker build --rm -f "./react-native/latest/Dockerfile" -t "$DOCKER_USERNAME/react-native:latest-$TRAVIS_TAG" "./react-native/latest"
docker tag "$DOCKER_USERNAME/react-native:latest-$TRAVIS_TAG" "$DOCKER_USERNAME/react-native:latest"
docker push $DOCKER_USERNAME/react-native:latest-$TRAVIS_TAG
docker push $DOCKER_USERNAME/react-native:latest

# fsharp
docker build --rm -f "./fsharp/latest/Dockerfile" -t "$DOCKER_USERNAME/fsharp:latest-$TRAVIS_TAG" "./fsharp/latest"
docker tag "$DOCKER_USERNAME/fsharp:latest-$TRAVIS_TAG" "$DOCKER_USERNAME/fsharp:latest"
docker push $DOCKER_USERNAME/fsharp:latest-$TRAVIS_TAG
docker push $DOCKER_USERNAME/fsharp:latest

# assets

# node
docker build --rm -f "./node/latest/Dockerfile" -t "$DOCKER_USERNAME/node:latest-$TRAVIS_TAG" "./node/latest"
docker tag "$DOCKER_USERNAME/node:latest-$TRAVIS_TAG" "$DOCKER_USERNAME/node:latest"
docker push $DOCKER_USERNAME/node:latest-$TRAVIS_TAG
docker push $DOCKER_USERNAME/node:latest

# python
docker build --rm -f "./python/latest/Dockerfile" -t "$DOCKER_USERNAME/python:latest-$TRAVIS_TAG" "./python/latest"
docker tag "$DOCKER_USERNAME/python:latest-$TRAVIS_TAG" "$DOCKER_USERNAME/python:latest"
docker push $DOCKER_USERNAME/python:latest-$TRAVIS_TAG
docker push $DOCKER_USERNAME/python:latest
docker build --rm -f "./python/2/Dockerfile" -t "$DOCKER_USERNAME/python:2-$TRAVIS_TAG" "./python/2"
docker tag "$DOCKER_USERNAME/python:2-$TRAVIS_TAG" "$DOCKER_USERNAME/python:2"
docker push $DOCKER_USERNAME/python:2-$TRAVIS_TAG
docker push $DOCKER_USERNAME/python:2
docker build --rm -f "./python/pytorch/latest/Dockerfile" -t "$DOCKER_USERNAME/python:pytorch-latest-$TRAVIS_TAG" "./python/pytorch/latest"
docker tag "$DOCKER_USERNAME/python:pytorch-latest-$TRAVIS_TAG" "$DOCKER_USERNAME/python:pytorch-latest"
docker push $DOCKER_USERNAME/python:pytorch-latest-$TRAVIS_TAG
docker push $DOCKER_USERNAME/python:pytorch-latest
docker build --rm -f "./python/pytorch/latest/Dockerfile" -t "$DOCKER_USERNAME/python:pytorch-$TRAVIS_TAG" "./python/pytorch/latest"
docker tag "$DOCKER_USERNAME/python:pytorch-$TRAVIS_TAG" "$DOCKER_USERNAME/python:pytorch"
docker push $DOCKER_USERNAME/python:pytorch-$TRAVIS_TAG
docker push $DOCKER_USERNAME/python:pytorch

# scripts

# csharp
docker build --rm -f "./csharp/latest/Dockerfile" -t "$DOCKER_USERNAME/csharp:latest-$TRAVIS_TAG" "./csharp/latest"
docker tag "$DOCKER_USERNAME/csharp:latest-$TRAVIS_TAG" "$DOCKER_USERNAME/csharp:latest"
docker push $DOCKER_USERNAME/csharp:latest-$TRAVIS_TAG
docker push $DOCKER_USERNAME/csharp:latest

# latex
docker build --rm -f "./latex/latest/Dockerfile" -t "$DOCKER_USERNAME/latex:latest-$TRAVIS_TAG" "./latex/latest"
docker tag "$DOCKER_USERNAME/latex:latest-$TRAVIS_TAG" "$DOCKER_USERNAME/latex:latest"
docker push $DOCKER_USERNAME/latex:latest-$TRAVIS_TAG
docker push $DOCKER_USERNAME/latex:latest

docker logout

