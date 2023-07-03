all: kill build

build: 
	cd srcs && docker compose build
	cd srcs && docker compose up -d

kill:
	@-docker stop $$(docker ps -q) 2>/dev/null
	@-docker rm $$(docker ps -a -q) 2>/dev/null

.PHONY: all build kill nginx
