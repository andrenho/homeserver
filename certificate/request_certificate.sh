#!/bin/sh

set -x

mkdir -p /ssl

if [ ! -f /ssl/fullchain.pem ]; then

  certbot certonly -n --agree-tos --email ${EMAIL} \
    --preferred-challenges=dns \
    --manual --manual-auth-hook $(pwd)/authenticator.sh \
    --manual-cleanup-hook $(pwd)/cleanup.sh \
    --fullchain-path /ssl \
    --key-path /ssl \
    -d ${DOMAIN} -d "*.${DOMAIN}" -v \
    ${EXTRA_PARAMS}

fi
