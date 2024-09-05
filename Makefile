
.PHONY: up down restart build logs

up:
	cd srcs && docker-compose up -d

down:
	cd srcs && docker-compose down

restart: down up

re-wp:
	cd srcs && docker-compose build --no-cache wordpress && docker-compose restart wordpress

re-nginx:
	cd srcs && docker-compose build --no-cache nginx && docker-compose restart nginx

re-mdb:
	cd srcs && docker-compose build --no-cache mariadb && dohelp:

build:
	cd srcs && docker-compose build

logs:
	cd srcs && docker-compose logs -f

clean: down
	docker rmi -f `docker images -q`