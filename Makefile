all: kill build

build: nginx

nginx:
	cd ./srcs/requirements/nginx && docker build -t nginx . && docker run -d -p 80:80 -p 443:443 nginx

kill:
	@-docker stop $$(docker ps -q)
	@-docker rm $$(docker ps -a -q)

.PHONY: all build kill nginx
