
DOCKER_COMPOSE = docker-compose
DOCKER = docker
RM = rm -rf

WP_VOLUME_DIR = /home/lsabatie/data/wordpress_vol
DB_VOLUME_DIR = /home/lsabatie/data/mariadb_vol

I_MAG			=	\033[3;35m
RESET = \033[0m



all: config run

config :
	@echo "Add lsabatie.42.fr in /etc/hosts..."
		@if ! grep -q "lsabatie.42.fr" /etc/hosts; then \
		echo "127.0.0.1 lsabatie.42.fr" | sudo tee -a /etc/hosts > /dev/null; \
		else echo "lsabatie.42.fr already exists in /etc/hosts!"; \
	fi

run: build_vol
	$(DOCKER_COMPOSE) -f ./srcs/docker-compose.yml up --build -d

down:
	$(DOCKER_COMPOSE) -f ./srcs/docker-compose.yml down -v

stop:
	$(DOCKER_COMPOSE) -f ./srcs/docker-compose.yml stop

start:
	$(DOCKER_COMPOSE) -f ./srcs/docker-compose.yml start

build_vol:
	test -d $(WP_VOLUME_DIR) || sudo mkdir -p $(WP_VOLUME_DIR)
	test -d $(DB_VOLUME_DIR) || sudo mkdir -p $(DB_VOLUME_DIR)

status:
	@echo ""
	@echo "$(I_MAG)Statut des images:$(RESET)"
	@$(DOCKER) images
	@echo ""
	@echo "$(I_MAG)Statut des conteneurs:$(RESET)"
	@$(DOCKER) ps
	@echo ""
	@echo "$(I_MAG)Statut des réseaux:$(RESET)"
	@$(DOCKER) network ls
	@echo ""
	@echo "$(I_MAG)Statut des volumes:$(RESET)"
	@$(DOCKER) volume ls
	@echo ""

rm_vol: down
	sudo rm -rf $(WP_VOLUME_DIR) || true
	sudo rm -rf $(DB_VOLUME_DIR) || true

clean: down rm_vol
	docker system prune -af --volumes

re: down run

reboot: clear all

.PHONY: all build up down clean re