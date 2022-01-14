#!/bin/sh

docker-compose stop
docker-compose rm -f
docker-compose up --build --force-recreate --no-deps -d pihole
docker-compose build --no-cache dev
docker-compose pull
docker-compose build --no-cache
docker-compose up --build --force-recreate --no-deps -d
