DOCKER_COMPOSE := srcs/docker-compose.yml

all:
	up

build:
	docker compose -f $(DOCKER_COMPOSE) build

up:
	docker compose -f $(DOCKER_COMPOSE) up -d

down: 
	docker compose -f $(DOCKER_COMPOSE) down