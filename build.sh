#!/bin/sh


# get the current release tag from GITHUB_REF and save it to the CURRENT_RELEASE variable
CURRENT_RELEASE=$(echo $GITHUB_REF | cut -d'/' -f 3)

docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD

# rust
docker build --rm -f "./rust/latest/Dockerfile" -t "$DOCKER_USERNAME/rust:latest-$CURRENT_RELEASE" "./rust/latest"
docker tag "$DOCKER_USERNAME/rust:latest-$CURRENT_RELEASE" "$DOCKER_USERNAME/rust:latest"
docker push $DOCKER_USERNAME/rust:latest-$CURRENT_RELEASE
docker push $DOCKER_USERNAME/rust:latest
docker rmi $DOCKER_USERNAME/rust:latest-$CURRENT_RELEASE
docker rmi $DOCKER_USERNAME/rust:latest
docker system prune --all --volumes --force

# cpp
docker build --rm -f "./cpp/latest/Dockerfile" -t "$DOCKER_USERNAME/cpp:latest-$CURRENT_RELEASE" "./cpp/latest"
docker tag "$DOCKER_USERNAME/cpp:latest-$CURRENT_RELEASE" "$DOCKER_USERNAME/cpp:latest"
docker push $DOCKER_USERNAME/cpp:latest-$CURRENT_RELEASE
docker push $DOCKER_USERNAME/cpp:latest
docker rmi $DOCKER_USERNAME/cpp:latest-$CURRENT_RELEASE
docker rmi $DOCKER_USERNAME/cpp:latest
docker system prune --all --volumes --force

# react-native
docker build --rm -f "./react-native/latest/Dockerfile" -t "$DOCKER_USERNAME/react-native:latest-$CURRENT_RELEASE" "./react-native/latest"
docker tag "$DOCKER_USERNAME/react-native:latest-$CURRENT_RELEASE" "$DOCKER_USERNAME/react-native:latest"
docker push $DOCKER_USERNAME/react-native:latest-$CURRENT_RELEASE
docker push $DOCKER_USERNAME/react-native:latest
docker rmi $DOCKER_USERNAME/react-native:latest-$CURRENT_RELEASE
docker rmi $DOCKER_USERNAME/react-native:latest
docker system prune --all --volumes --force

# fsharp
docker build --rm -f "./fsharp/latest/Dockerfile" -t "$DOCKER_USERNAME/fsharp:latest-$CURRENT_RELEASE" "./fsharp/latest"
docker tag "$DOCKER_USERNAME/fsharp:latest-$CURRENT_RELEASE" "$DOCKER_USERNAME/fsharp:latest"
docker push $DOCKER_USERNAME/fsharp:latest-$CURRENT_RELEASE
docker push $DOCKER_USERNAME/fsharp:latest
docker rmi $DOCKER_USERNAME/fsharp:latest-$CURRENT_RELEASE
docker rmi $DOCKER_USERNAME/fsharp:latest
docker system prune --all --volumes --force

# assets

# node
docker build --rm -f "./node/latest/Dockerfile" -t "$DOCKER_USERNAME/node:latest-$CURRENT_RELEASE" "./node/latest"
docker tag "$DOCKER_USERNAME/node:latest-$CURRENT_RELEASE" "$DOCKER_USERNAME/node:latest"
docker push $DOCKER_USERNAME/node:latest-$CURRENT_RELEASE
docker push $DOCKER_USERNAME/node:latest
docker rmi $DOCKER_USERNAME/node:latest-$CURRENT_RELEASE
docker rmi $DOCKER_USERNAME/node:latest
docker system prune --all --volumes --force

# python
docker build --rm -f "./python/latest/Dockerfile" -t "$DOCKER_USERNAME/python:latest-$CURRENT_RELEASE" "./python/latest"
docker tag "$DOCKER_USERNAME/python:latest-$CURRENT_RELEASE" "$DOCKER_USERNAME/python:latest"
docker push $DOCKER_USERNAME/python:latest-$CURRENT_RELEASE
docker push $DOCKER_USERNAME/python:latest
docker rmi $DOCKER_USERNAME/python:latest-$CURRENT_RELEASE
docker rmi $DOCKER_USERNAME/python:latest
docker system prune --all --volumes --force
docker build --rm -f "./python/pytorch/latest/Dockerfile" -t "$DOCKER_USERNAME/python:pytorch-latest-$CURRENT_RELEASE" "./python/pytorch/latest"
docker tag "$DOCKER_USERNAME/python:pytorch-latest-$CURRENT_RELEASE" "$DOCKER_USERNAME/python:pytorch-latest"
docker push $DOCKER_USERNAME/python:pytorch-latest-$CURRENT_RELEASE
docker push $DOCKER_USERNAME/python:pytorch-latest
docker rmi $DOCKER_USERNAME/python:pytorch-latest-$CURRENT_RELEASE
docker rmi $DOCKER_USERNAME/python:pytorch-latest
docker system prune --all --volumes --force
docker build --rm -f "./python/pytorch/latest/Dockerfile" -t "$DOCKER_USERNAME/python:pytorch-$CURRENT_RELEASE" "./python/pytorch/latest"
docker tag "$DOCKER_USERNAME/python:pytorch-$CURRENT_RELEASE" "$DOCKER_USERNAME/python:pytorch"
docker push $DOCKER_USERNAME/python:pytorch-$CURRENT_RELEASE
docker push $DOCKER_USERNAME/python:pytorch
docker rmi $DOCKER_USERNAME/python:pytorch-$CURRENT_RELEASE
docker rmi $DOCKER_USERNAME/python:pytorch
docker system prune --all --volumes --force

# scripts

# csharp
docker build --rm -f "./csharp/latest/Dockerfile" -t "$DOCKER_USERNAME/csharp:latest-$CURRENT_RELEASE" "./csharp/latest"
docker tag "$DOCKER_USERNAME/csharp:latest-$CURRENT_RELEASE" "$DOCKER_USERNAME/csharp:latest"
docker push $DOCKER_USERNAME/csharp:latest-$CURRENT_RELEASE
docker push $DOCKER_USERNAME/csharp:latest
docker rmi $DOCKER_USERNAME/csharp:latest-$CURRENT_RELEASE
docker rmi $DOCKER_USERNAME/csharp:latest
docker system prune --all --volumes --force

# latex
docker build --rm -f "./latex/latest/Dockerfile" -t "$DOCKER_USERNAME/latex:latest-$CURRENT_RELEASE" "./latex/latest"
docker tag "$DOCKER_USERNAME/latex:latest-$CURRENT_RELEASE" "$DOCKER_USERNAME/latex:latest"
docker push $DOCKER_USERNAME/latex:latest-$CURRENT_RELEASE
docker push $DOCKER_USERNAME/latex:latest
docker rmi $DOCKER_USERNAME/latex:latest-$CURRENT_RELEASE
docker rmi $DOCKER_USERNAME/latex:latest
docker system prune --all --volumes --force

docker logout

