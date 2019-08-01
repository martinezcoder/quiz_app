#!/bin/bash

docker build -f backend.dockerfile -t docker_test/backend ./
docker run --rm -p 4567:4567 docker_test/backend
