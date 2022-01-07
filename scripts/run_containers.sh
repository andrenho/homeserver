#!/bin/bash

die() { echo "$*" 1>&2 ; exit 1; }

if [[ $EUID -eq 0 ]]; then
  echo "This script must NOT be run as root" 1>&2
  exit 1
fi

set -ex  # stop at errors

aws --profile default configure get aws_access_key_id > /dev/null || die 'Missing AWS credentials file.'
docker-compose build --no-cache

sudo cp arch/docker-compose-app.service /etc/systemd/system/
sudo systemctl enable docker-compose-app
sudo systemctl restart docker-compose-app
sudo systemctl daemon-reload
