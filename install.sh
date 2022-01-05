#!/bin/sh

set -ex  # stop at errors

./scripts/user_config.sh
./scripts/update_packages.sh
./scripts/run_containers.sh
