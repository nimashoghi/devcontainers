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
