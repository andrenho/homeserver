#/bin/sh

sudo systemctl stop docker-compose-app
docker-compose stop
docker system prune --volumes -f
docker network rm $(docker network ls | grep "bridge" | awk '/ / { print $1 }')
docker rm $(docker ps -qa --no-trunc --filter "status=exited")
rm -rf ~/.cache/*
sudo pacman -Scc --noconfirm
sudo journalctl --vacuum-size=20M
