#!/bin/sh

set -e

docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD

# rust
docker build --rm -f "./rust/latest/Dockerfile" -t "$DOCKER_USERNAME/rust:latest-$TRAVIS_TAG" "./rust/latest"
docker tag "$DOCKER_USERNAME/rust:latest-$TRAVIS_TAG" "$DOCKER_USERNAME/rust:latest"
docker push $DOCKER_USERNAME/rust:latest-$TRAVIS_TAG
docker push $DOCKER_USERNAME/rust:latest

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

# clojure
docker build --rm -f "./clojure/latest/Dockerfile" -t "$DOCKER_USERNAME/clojure:latest-$TRAVIS_TAG" "./clojure/latest"
docker tag "$DOCKER_USERNAME/clojure:latest-$TRAVIS_TAG" "$DOCKER_USERNAME/clojure:latest"
docker push $DOCKER_USERNAME/clojure:latest-$TRAVIS_TAG
docker push $DOCKER_USERNAME/clojure:latest

# assets

# node
docker build --rm -f "./node/alpine/latest/Dockerfile" -t "$DOCKER_USERNAME/node:alpine-latest-$TRAVIS_TAG" "./node/alpine/latest"
docker tag "$DOCKER_USERNAME/node:alpine-latest-$TRAVIS_TAG" "$DOCKER_USERNAME/node:alpine-latest"
docker push $DOCKER_USERNAME/node:alpine-latest-$TRAVIS_TAG
docker push $DOCKER_USERNAME/node:alpine-latest
docker build --rm -f "./node/alpine/latest/Dockerfile" -t "$DOCKER_USERNAME/node:latest-$TRAVIS_TAG" "./node/alpine/latest"
docker tag "$DOCKER_USERNAME/node:latest-$TRAVIS_TAG" "$DOCKER_USERNAME/node:latest"
docker push $DOCKER_USERNAME/node:latest-$TRAVIS_TAG
docker push $DOCKER_USERNAME/node:latest
docker build --rm -f "./node/alpine/latest/Dockerfile" -t "$DOCKER_USERNAME/node:alpine-$TRAVIS_TAG" "./node/alpine/latest"
docker tag "$DOCKER_USERNAME/node:alpine-$TRAVIS_TAG" "$DOCKER_USERNAME/node:alpine"
docker push $DOCKER_USERNAME/node:alpine-$TRAVIS_TAG
docker push $DOCKER_USERNAME/node:alpine
docker build --rm -f "./node/alpine/12/Dockerfile" -t "$DOCKER_USERNAME/node:alpine-12-$TRAVIS_TAG" "./node/alpine/12"
docker tag "$DOCKER_USERNAME/node:alpine-12-$TRAVIS_TAG" "$DOCKER_USERNAME/node:alpine-12"
docker push $DOCKER_USERNAME/node:alpine-12-$TRAVIS_TAG
docker push $DOCKER_USERNAME/node:alpine-12
docker build --rm -f "./node/slim/latest/Dockerfile" -t "$DOCKER_USERNAME/node:slim-latest-$TRAVIS_TAG" "./node/slim/latest"
docker tag "$DOCKER_USERNAME/node:slim-latest-$TRAVIS_TAG" "$DOCKER_USERNAME/node:slim-latest"
docker push $DOCKER_USERNAME/node:slim-latest-$TRAVIS_TAG
docker push $DOCKER_USERNAME/node:slim-latest
docker build --rm -f "./node/slim/latest/Dockerfile" -t "$DOCKER_USERNAME/node:slim-$TRAVIS_TAG" "./node/slim/latest"
docker tag "$DOCKER_USERNAME/node:slim-$TRAVIS_TAG" "$DOCKER_USERNAME/node:slim"
docker push $DOCKER_USERNAME/node:slim-$TRAVIS_TAG
docker push $DOCKER_USERNAME/node:slim

# python
docker build --rm -f "./python/alpine/latest/Dockerfile" -t "$DOCKER_USERNAME/python:alpine-latest-$TRAVIS_TAG" "./python/alpine/latest"
docker tag "$DOCKER_USERNAME/python:alpine-latest-$TRAVIS_TAG" "$DOCKER_USERNAME/python:alpine-latest"
docker push $DOCKER_USERNAME/python:alpine-latest-$TRAVIS_TAG
docker push $DOCKER_USERNAME/python:alpine-latest
docker build --rm -f "./python/alpine/latest/Dockerfile" -t "$DOCKER_USERNAME/python:latest-$TRAVIS_TAG" "./python/alpine/latest"
docker tag "$DOCKER_USERNAME/python:latest-$TRAVIS_TAG" "$DOCKER_USERNAME/python:latest"
docker push $DOCKER_USERNAME/python:latest-$TRAVIS_TAG
docker push $DOCKER_USERNAME/python:latest
docker build --rm -f "./python/alpine/latest/Dockerfile" -t "$DOCKER_USERNAME/python:alpine-$TRAVIS_TAG" "./python/alpine/latest"
docker tag "$DOCKER_USERNAME/python:alpine-$TRAVIS_TAG" "$DOCKER_USERNAME/python:alpine"
docker push $DOCKER_USERNAME/python:alpine-$TRAVIS_TAG
docker push $DOCKER_USERNAME/python:alpine
docker build --rm -f "./python/alpine/2/Dockerfile" -t "$DOCKER_USERNAME/python:alpine-2-$TRAVIS_TAG" "./python/alpine/2"
docker tag "$DOCKER_USERNAME/python:alpine-2-$TRAVIS_TAG" "$DOCKER_USERNAME/python:alpine-2"
docker push $DOCKER_USERNAME/python:alpine-2-$TRAVIS_TAG
docker push $DOCKER_USERNAME/python:alpine-2
docker build --rm -f "./python/slim/latest/Dockerfile" -t "$DOCKER_USERNAME/python:slim-latest-$TRAVIS_TAG" "./python/slim/latest"
docker tag "$DOCKER_USERNAME/python:slim-latest-$TRAVIS_TAG" "$DOCKER_USERNAME/python:slim-latest"
docker push $DOCKER_USERNAME/python:slim-latest-$TRAVIS_TAG
docker push $DOCKER_USERNAME/python:slim-latest
docker build --rm -f "./python/slim/latest/Dockerfile" -t "$DOCKER_USERNAME/python:slim-$TRAVIS_TAG" "./python/slim/latest"
docker tag "$DOCKER_USERNAME/python:slim-$TRAVIS_TAG" "$DOCKER_USERNAME/python:slim"
docker push $DOCKER_USERNAME/python:slim-$TRAVIS_TAG
docker push $DOCKER_USERNAME/python:slim
docker build --rm -f "./python/slim/2/Dockerfile" -t "$DOCKER_USERNAME/python:slim-2-$TRAVIS_TAG" "./python/slim/2"
docker tag "$DOCKER_USERNAME/python:slim-2-$TRAVIS_TAG" "$DOCKER_USERNAME/python:slim-2"
docker push $DOCKER_USERNAME/python:slim-2-$TRAVIS_TAG
docker push $DOCKER_USERNAME/python:slim-2
docker build --rm -f "./python/pytorch/latest/Dockerfile" -t "$DOCKER_USERNAME/python:pytorch-latest-$TRAVIS_TAG" "./python/pytorch/latest"
docker tag "$DOCKER_USERNAME/python:pytorch-latest-$TRAVIS_TAG" "$DOCKER_USERNAME/python:pytorch-latest"
docker push $DOCKER_USERNAME/python:pytorch-latest-$TRAVIS_TAG
docker push $DOCKER_USERNAME/python:pytorch-latest
docker build --rm -f "./python/pytorch/latest/Dockerfile" -t "$DOCKER_USERNAME/python:pytorch-$TRAVIS_TAG" "./python/pytorch/latest"
docker tag "$DOCKER_USERNAME/python:pytorch-$TRAVIS_TAG" "$DOCKER_USERNAME/python:pytorch"
docker push $DOCKER_USERNAME/python:pytorch-$TRAVIS_TAG
docker push $DOCKER_USERNAME/python:pytorch

# scripts

# latex
docker build --rm -f "./latex/latest/Dockerfile" -t "$DOCKER_USERNAME/latex:latest-$TRAVIS_TAG" "./latex/latest"
docker tag "$DOCKER_USERNAME/latex:latest-$TRAVIS_TAG" "$DOCKER_USERNAME/latex:latest"
docker push $DOCKER_USERNAME/latex:latest-$TRAVIS_TAG
docker push $DOCKER_USERNAME/latex:latest

docker logout
