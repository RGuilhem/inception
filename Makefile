NAME = inception
SRCS = srcs
ENV_F = $(SRCS)/.env
COMPOSE = $(SRCS)/docker-compose.yml
COMPOSE_FULL = -f $(COMPOSE) -p $(NAME)

all: build

#TODO maybe add to host
install:
	./set_env.sh
	if ! cd /home/graux/data/database 2>/dev/null; then mkdir -p /home/graux/data/database/; fi
	if ! cd /home/graux/data/www 2>/dev/null; then mkdir -p /home/graux/data/www/; fi

build: install
	docker compose $(COMPOSE_FULL) up -d --build

start:
	docker compose $(COMPOSE_FULL) start

stop:
	docker compose $(COMPOSE_FULL) stop

status:
	docker compose $(COMPOSE_FULL) ls
	docker compose $(COMPOSE_FULL) ps
	docker compose $(COMPOSE_FULL) images

fclean: stop
	docker system prune -f
	rm srcs/.env

re: fclean all

.PHONY: all build start stop fclean re
