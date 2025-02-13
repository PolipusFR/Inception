all: up

up:
	docker-compose -f ./srcs/docker-compose.yml up --build

down:
	docker-compose -f ./srcs/docker-compose.yml down

stop:
	docker-compose -f ./srcs/docker-compose.yml stop

start:
	docker-compose -f ./srcs/docker-compose.yml start

clean: down
	sudo docker system prune -af --volumes

re: clean all

.PHONY: all build up down clean re