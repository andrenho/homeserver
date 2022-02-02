#!/bin/sh

set -x

mkdir -p /ssl

if [ ! -f /ssl/fullchain.pem ]; then

  certbot certonly -n --agree-tos --email ${EMAIL} --manual-public-ip-logging-ok \
    --preferred-challenges=dns \
    --manual --manual-auth-hook $(pwd)/authenticator.sh \
    --manual-cleanup-hook $(pwd)/cleanup.sh \
    --fullchain-path /ssl/standalone.pub.key \
    --key-path /ssl/standalone.priv.key \
    -d ${DOMAIN} \
    ${EXTRA_PARAMS}

  certbot certonly -n --agree-tos --email ${EMAIL} --manual-public-ip-logging-ok \
    --preferred-challenges=dns \
    --manual --manual-auth-hook $(pwd)/authenticator.sh \
    --manual-cleanup-hook $(pwd)/cleanup.sh \
    --fullchain-path /ssl/wildcard.pub.key \
    --key-path /ssl/wildcard.priv.key \
    -d '*.'"${DOMAIN}"'' \
    ${EXTRA_PARAMS}
fi
