#!/bin/sh

set -x

certbot certonly -n --agree-tos --email ${EMAIL} --manual-public-ip-logging-ok \
  --preferred-challenges=dns \
  --manual --manual-auth-hook $(pwd)/authenticator.sh \
  --manual-cleanup-hook $(pwd)/cleanup.sh \
  -d ${DOMAIN} \
  ${EXTRA_PARAMS}

certbot certonly -n --agree-tos --email ${EMAIL} --manual-public-ip-logging-ok \
  --preferred-challenges=dns \
  --manual --manual-auth-hook $(pwd)/authenticator.sh \
  --manual-cleanup-hook $(pwd)/cleanup.sh \
  -d '*.'"${DOMAIN}"'' \
  ${EXTRA_PARAMS}
