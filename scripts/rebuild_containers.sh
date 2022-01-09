#!/bin/sh

docker-compose stop
docker-compose rm -f
docker-compose pull
docker-compose build --no-cache
docker-compose up --build --force-recreate --no-deps -d
