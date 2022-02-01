#!/bin/sh

sudo mkdir /root/.aws
sudo cp /home/andre/.aws/* /root/.aws
sudo certbot certonly --agree-tos --email andre.nho@gmail.com \
  --preferred-challenges=dns \
  --manual --manual-auth-hook $(pwd)/authenticator.sh \
  --manual-cleanup-hook $(pwd)/cleanup.sh \
  -d homeserver.gamesmith.uk -d '*.homeserver.gamesmith.uk' -v \
  --staging \
  $@
