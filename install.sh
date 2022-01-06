#!/bin/sh

set -ex  # stop at errors

mkdir -p ~/downloads        \
  ~/homeserver_data/torrent \
  ~/homeserver_data/plex    \
  ~/homeserver_data/wiki

./scripts/user_config.sh
./scripts/update_packages.sh
./scripts/run_containers.sh
