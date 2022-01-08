#!/bin/sh

docker-compose down
docker-compose build --no-cache
docker-compose up --build --force-recreate --no-deps -d
