NAME = inception
SRCS = srcs
ENV_F = $(SRCS)/.env
COMPOSE = $(SRCS)/docker-compose.yml
COMPOSE_FULL = -f $(COMPOSE) -p $(NAME)

all: build

build:
	docker compose $(COMPOSE_FULL) up -d --build

start:
	docker compose $(COMPOSE_FULL) start

stop:
	docker compose $(COMPOSE_FULL) stop

status:
	docker compose $(COMPOSE_FULL) ps

clean:
	rm -rf ~/data/www/*
	rm -rf ~/data/database/*

fclean: stop clean
	docker rmi -f nginx
	docker rm -f nginx
	docker rmi -f mariadb
	docker rm -f mariadb
	docker rmi -f wordpress
	docker rm -f wordpress
	docker volume rm -f inception_database
	docker volume rm -f inception_www
	#docker network rm inception

re: fclean all

.PHONY: all build run clean fclean re
