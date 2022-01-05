#!/bin/sh

set -ex  # stop at errors

# Install packages

pacman -Suy
pacman -S --needed \
  wget iwd dhcpcd bash-completion sudo docker man-db man-pages vim tmux git python gcc mlocate \
  dnsutils docker-compose htop lsof inetutils unzip mc

# Get configuration files from the internet
mkdir -p /usr/share/git-core/contrib/completion
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh > /usr/share/git-core/contrib/completion/git-prompt.sh

# Start services
systemctl enable sshd docker
systemctl start sshd docker
