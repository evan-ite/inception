# Define the default target
.PHONY: up down restart build logs

# Start the Docker Compose services
up:
	cd srcs && docker-compose up -d

# Stop the Docker Compose services
down:
	cd srcs && docker-compose down

# Restart the Docker Compose services
restart: down up

re-wp:
	cd srcs && docker-compose build --no-cache wordpress && docker-compose restart wordpress

re-nginx:
	cd srcs && docker-compose build --no-cache nginx && docker-compose restart nginx

re-mdb:
	cd srcs && docker-compose build --no-cache mariadb && docker-compose restart mariadb

# Build the Docker Compose services
build:
	cd srcs && docker-compose build

# View logs of the Docker Compose services
logs:
	cd srcs && docker-compose logs -f

clean: down
	docker rmi -f `docker images -q`