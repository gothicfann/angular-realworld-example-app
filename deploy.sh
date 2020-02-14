#!/bin/bash

docker pull ${IMAGE}
docker run -d -p 80:80 --name ${PROJECT} ${IMAGE} 2> /dev/null
docker stop ${PROJECT}
docker rm ${PROJECT}
docker run -d -p 80:80 --name ${PROJECT} ${IMAGE}