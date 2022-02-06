#!/bin/sh

git pull && docker-compose --env-file /root/.docker-env up --build -d && docker restart proxy
