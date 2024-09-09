#
# Makefile for the 42 Inception project
#
# By Elise van Iterson

.PHONY: up down restart volumes re-wp re-nginx re-mdb build logs clean

up: volumes env
	cd srcs && docker-compose up -d

down:
	cd srcs && docker-compose down

restart: down up

env:
	./srcs/requirements/tools/generate_keys.sh

volumes:
	mkdir -p ~/data/mariadb
	mkdir -p ~/data/wordpress

re-wp: volumes
	cd srcs && docker-compose build --no-cache wordpress && docker-compose restart wordpress

re-nginx:
	cd srcs && docker-compose build --no-cache nginx && docker-compose restart nginx

re-mdb: volumes
	cd srcs && docker-compose build --no-cache mariadb && docker-compose restart mariadb

build: volumes
	cd srcs && docker-compose build

clean: down
	docker system prune -af
