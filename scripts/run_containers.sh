#!/bin/sh

if [[ $EUID -eq 0 ]]; then
  echo "This script must NOT be run as root" 1>&2
  exit 1
fi

set -ex  # stop at errors

docker-compose build --no-cache

sudo cp arch/docker-compose-app.service /etc/systemd/system/
sudo systemctl restart docker-compose-app
sudo systemctl daemon-reload
