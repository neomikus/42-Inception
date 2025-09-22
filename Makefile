DOCKER_COMPOSE	= srcs/docker-compose.yml

SECRETS_DIR	= secrets

SSL_CERT	= $(SECRETS_DIR)/self-signed.crt

DATA_DIR	= /home/fcasaubo/data
DATABASE	= $(DATA_DIR)/database
SITE		= $(DATA_DIR)/site

all: $(SSL_CERT) build up


$(SSL_CERT):
	sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout $(SECRETS_DIR)/self-signed.key -out $(SSL_CERT) -subj "/C=ES/ST=Bizkaia/L=Urduliz/O=42Urduliz/CN=localhost"

build: $(DATABASE) $(SITE)
	sudo docker compose -f $(DOCKER_COMPOSE) build

$(DATABASE): $(DATA_DIR)
	mkdir -p $@

$(SITE): $(DATA_DIR)
	mkdir -p $@

$(DATA_DIR):
	mkdir -p $@

up:
	sudo docker compose -f $(DOCKER_COMPOSE) up -d

down: 
	sudo docker compose -f $(DOCKER_COMPOSE) down

clean: down
	sudo docker volume prune
	sudo rm -rf $(DATA_DIR)/*

re: clean all