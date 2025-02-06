all: up

build:
	docker-compose build

up: build
	docker-compose up -d

down:
	docker-compose down

clean: down
	docker system prune -af --volumes

re: clean all

.PHONY: all build up down clean re