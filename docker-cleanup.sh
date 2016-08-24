#/bin/bash

CONTAINERS=$(docker ps -a -f "status=exited" -f "name=runner-" | tail -n +2 | awk '{print $1}')
docker rm -v $CONTAINERS

IMAGES=$(docker images -f "dangling=true" | tail -n +2 | grep -e "week" -e "month" | awk '{print $3}')
docker rmi $IMAGES
