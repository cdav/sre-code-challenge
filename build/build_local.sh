#!/bin/bash
PROJECT=scc
TAG=scc-flask
VER=development

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" > /dev/null 2>&1 && pwd )"

# get running 
scc_current="$(docker ps -aq --filter ancestor="$TAG":"$VER")"
mysql_current="$(docker ps -aq --filter aancestor="$TAG":"$VER")"

docker kill $scc_current $mysql_current
docker rm $scc_current $mysql_current

# build a new image
docker build . -t "$TAG:$VER"
if [[ $? -ne 0 ]]; then
  echo -e "\n--> Build failed!\n"
  exit 1 
fi

# create a network if it doesn't exist
docker network ls | grep $project
if [[ $? -ne 0 ]]; then
  docker network create -d bridge $project-net
fi

# run flask container
docker run -d --name scc-flask --network=$project-net
 
# run mysql container
docker run -d --name scc-mysql --network=$project-net mysql:8.0 