PROJECT_NAME="$(shell basename "$(PWD)")"
PROJECT_DIR="$(shell pwd)"
DOCKER_COMPOSE="$(shell which docker-compose)"
DOCKER="$(shell which docker)"
CONTAINER_PHP="php-unit"


init: generate-env  up

sleep-5:
	sleep 5

up:
	docker-compose  --env-file .env.local up --build -d

down:
	docker-compose  --env-file .env.local down --remove-orphans


generate-env:
	@if [ ! -f .env.local ]; then \
		cp .env .env.local && \
		sed -i "s/^POSTGRES_PASSWORD=/POSTGRES_PASSWORD=$(shell openssl rand -hex 8)/" .env.local; \
	fi

bash:
	${DOCKER_COMPOSE} exec -it ${CONTAINER_PHP} /bin/bash

bash-cli:
	docker run --rm  ${CONTAINER_PHP_CLI} sh

ps:
	${DOCKER_COMPOSE} ps

logs:
	${DOCKER_COMPOSE} logs -f

ci:
	${DOCKER_COMPOSE} exec ${CONTAINER_PHP} composer install