#!/bin/bash

#clean an remove all images
#stop  an remove containers
docker stop $(docker ps -a -q)

docker rm $(docker ps -a -q)

# remove images
docker rmi $(docker images)

#BUILD the docker image
docker build . -t kousseila/superset-mysql:2.0.1rc6

#start containers with docker compose

docker-compose -f docker-compose.yml up -d

# open the web page for superset

xdg-open "http://localhost:8088"

#open the web page for server 

xdg-open "http://localhost:5555"

#open the web page for mysql-workbench

xdg-open "http://localhost:3000"




