# Docker for Liferay 7 CE GA5 Tomcat HSQL

## Prerequisites
- docker software

## Steps
1. Checkout this branch
1. Go to the checkout directory in command prompt
1. Build an image using ```docker build -t liferay-ce:7.0-ga5 .```
1. Verify that the image is built using ```docker images```
1. Start a container using ```docker run -d --name mylfr7 -p 8080:8080 -p 11311:11311 -v storage:/usr/local liferay-ce:7.0-ga5```
1. Verify that the container is created and up using ```docker ps -a```
1. To enter into container, use ```docker exec -it mylfr7 /bin/bash```
1. To enter into container with liferay as user, use ```docker exec -it -u liferay mylfr7 /bin/bash```
1. Exit container using ```exit```
1. To stop the container, use ```docker container stop mylfr7```
1. To start the container, use ```docker container start mylfr7```
1. To view status of docker daemon, use ```docker stats -a```
