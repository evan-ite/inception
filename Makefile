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

# Build the Docker Compose services
build:
	cd srcs && docker-compose build

# View logs of the Docker Compose services
logs:
	cd srcs && docker-compose logs -f
