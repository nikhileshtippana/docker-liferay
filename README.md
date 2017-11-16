# Docker for Liferay 7 CE GA5 Tomcat HSQL

## Prerequisites
- docker software

## Steps
- Checkout this branch
- Go to the checkout directory in command prompt
- Use "docker build -t liferay-ce:7.0-ga5 ." to build an image.
- Use "docker images" to verify that the image is created.
- Use "docker run -d --name mylfr7 -p 8080:8080 -p 11311:11311 -v storage:/usr/local liferay-ce:7.0-ga5" to start a container.
- Use "docker exec -it mylfr7 /bin/bash" to enter into container.
- Use "docker exec -it -u liferay mylfr7 /bin/bash" to enter into container with liferay as user.
- Use "exit" to exit container.
- Use "docker container stop mylfr7" to stop the container.
- Use "docker container start mylfr7" to start the container.
- Use "docker stats -a" to get status of the docker daemon.