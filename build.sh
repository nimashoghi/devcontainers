docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD

bash ./buster/build.sh
bash ./alpine/build.sh

docker logout
