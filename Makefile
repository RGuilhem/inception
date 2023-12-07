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

re: fclean all

.PHONY: all build run clean fclean re
