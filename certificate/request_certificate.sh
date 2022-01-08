#!/bin/sh

sudo mkdir /root/.aws
sudo cp /home/andre/.aws/* /root/.aws
sudo certbot certonly --agree-tos --email andre.nho@gmail.com \
  --preferred-challenges=dns \
  --manual --manual-auth-hook /home/andre/homeserver/certificate/authenticator.sh \
  --manual-cleanup-hook /home/andre/homeserver/certificate/cleanup.sh \
  -d homeserver.gamesmith.uk -d '*.homeserver.gamesmith.uk' -v
