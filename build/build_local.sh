#!/bin/bash
PROJECT=scc
FLASK_TAG=scc-flask
MYSQL_TAG=scc-mysql
VER=development

MY_PATH="`dirname \"$0\"`"              # relative
MY_PATH="`( cd \"$MY_PATH\" && pwd )`"
MY_REPO="${MY_PATH%/*}"

# get running 
flask_current="$(docker ps -aq --filter ancestor="$FLASK_TAG":"$VER")"
mysql_current="$(docker ps -aq --filter ancestor="$MYSQL_TAG":"$VER")"

docker kill $flask_current $mysql_current
docker rm $flask_current $mysql_current

# build flask image
cd $MY_REPO/flask
docker build . -t "$FLASK_TAG:$VER"
if [[ $? -ne 0 ]]; then
  echo -e "\n--> Build failed!\n"
  exit 1 
fi

# build mysql image
cd $MY_REPO/mysql 
docker build . -t "$MYSQL_TAG:$VER"
if [[ $? -ne 0 ]]; then
  echo -e "\n--> Build failed!\n"
  exit 1 
fi

# create a network if it doesn't exist
docker network ls | grep $PROJECT
if [[ $? -ne 0 ]]; then
  docker network create -d bridge $PROJECT-net
fi

# run flask container
docker run -d -p 5000:5000 --rm --name scc-flask --network=$PROJECT-net -e FLASK_ENV="development" "$FLASK_TAG:$VER" 
 
# run mysql container
docker run -d --rm --name scc-mysql --network=$PROJECT-net "$MYSQL_TAG:$VER" 
