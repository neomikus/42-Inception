DOCKER_COMPOSE	:= srcs/docker-compose.yml

SECRETS_DIR	:= secrets

SSL_CERT	:= $(SECRETS_DIR)/self-signed.crt


all: $(SSL_CERT) build up


$(SSL_CERT):
	sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout $(SECRETS_DIR)/self-signed.key -out $(SSL_CERT) -subj "/C=ES/ST=Bizkaia/L=Urduliz/O=42Urduliz/CN=localhost"

build:
	sudo docker compose -f $(DOCKER_COMPOSE) build

up:
	sudo docker compose -f $(DOCKER_COMPOSE) up -d

down: 
	sudo docker compose -f $(DOCKER_COMPOSE) down
