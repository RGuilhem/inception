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
	@$(MAKE) status

debug: install
	docker compose $(COMPOSE_FULL) up -d --build
	docker compose $(COMPOSE_FULL) logs -f
	@$(MAKE) status
start:
	docker compose $(COMPOSE_FULL) start

stop:
	docker compose $(COMPOSE_FULL) stop

nginx:
	docker exec -it $$(docker ps | grep nginx | awk '{print $$1}') sh

wordpress:
	docker exec -it $$(docker ps | grep wordpress | awk '{print $$1}') sh

mariadb:
	docker exec -it $$(docker ps | grep mariadb | awk '{print $$1}') sh

status:
	docker compose $(COMPOSE_FULL) ps -a

fclean: stop
	docker compose $(COMPOSE_FULL) down
	docker volume rm inception_www
	docker system prune -f
	rm -rf srcs/.env

re: fclean all

.PHONY: all build start stop fclean re
