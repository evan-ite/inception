
.PHONY: up down restart volumes re-wp re-nginx re-mdb build logs clean

up: volumes
	cd srcs && docker-compose up -d

down:
	cd srcs && docker-compose down

restart: down up

volumes:
	mkdir -p ~/data/mariadb
	mkdir -p ~/data/wordpress

re-wp: volumes
	cd srcs && docker-compose build --no-cache wordpress && docker-compose restart wordpress

re-nginx:
	cd srcs && docker-compose build --no-cache nginx && docker-compose restart nginx

re-mdb: volumes
	cd srcs && docker-compose build --no-cache mariadb && dohelp:

build: volumes
	cd srcs && docker-compose build

logs:
	cd srcs && docker-compose logs -f

clean: down
	docker rm -f `docker ps -aq`
	docker rmi -f `docker images -q`
