#/bin/sh

sudo systemctl stop docker-compose-app
docker system prune --volumes -f
sudo pacman -Scc --noconfirm
