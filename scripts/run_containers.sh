#!/bin/sh

set -ex  # stop at errors

docker-compose build --no-cache

cp arch/docker-compose-app.service /etc/systemd/system/
systemctl restart docker-compose-app
systemctl daemon-reload
