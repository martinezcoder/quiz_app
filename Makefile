.PHONY: db

default: help

help:
	@printf "\033[1mUsage:\033[0m\n\n"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

build:
build: sync-repo down build-frontend build-backend

sync-repo:  ## Sync repository and submodules
	git fetch --all
	git submodule sync
	git submodule update --init

down:
	docker-compose down

up:
	docker-compose up

build-frontend:
build-frontend: clean-frontend build-frontend-image

build-backend:
build-backend: clean-backend build-backend-image

clean-frontend:
	docker rmi -f `docker images | grep docker_test | grep frontend | awk '{print $3}'` || true

clean-backend:
	docker rmi -f `docker images | grep docker_test | grep backend | awk '{print $3}'` || true

build-frontend-image:
	docker build -f frontend.dockerfile -t docker_test/frontend ./

build-backend-image:
	docker build -f backend.dockerfile -t docker_test/backend ./

frontend-bash:
	docker run -t docker_test/frontend bash

backend-bash:
	docker run -t docker_test/backend bash

frontend-run:
	docker run -p 8080:8080 -t docker_test/frontend

backend-run:
	docker run -p 4567:4567 -t docker_test/backend