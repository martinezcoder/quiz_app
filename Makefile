.PHONY: db

default: help

help:
	@printf "\033[1mUsage:\033[0m\n\n"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

sync-repo:  ## Sync repository and submodules
	git fetch --all
	git submodule sync
	git submodule update --init

down: ## Docker compose down
	docker-compose down

up: ## Docker compoose up
	docker-compose up

#### BUILD

build: ## Prepares the frontend and backend servers to be run
build: sync-repo down build-frontend build-backend

build-frontend: ## Builds the docker image for the frontend server
build-frontend: clean-frontend build-frontend-image

build-backend: ## Builds the docker image for the backend server
build-backend: clean-backend build-backend-image

#### RUN IMAGE

frontend-run: ## Runs frontend image
frontend-run:
	docker run -p 8080:8080 -t quiz_app/frontend

backend-run: ## Runs backend image
backend-run:
	docker run -p 4567:4567 -t quiz_app/backend

#### BUILD IMAGES

build-frontend-image:
	docker build -f frontend.dockerfile -t quiz_app/frontend ./

build-backend-image:
	docker build -f backend.dockerfile -t quiz_app/backend ./

#### CLEAN

clean-frontend:
	docker rmi -f `docker images | grep quiz_app | grep frontend | awk '{print $3}'` || true

clean-backend:
	docker rmi -f `docker images | grep quiz_app | grep backend | awk '{print $3}'` || true

#### OPEN BASH

frontend-bash:
	docker run -t quiz_app/frontend bash

backend-bash:
	docker run -t quiz_app/backend bash
