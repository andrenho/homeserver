#!/bin/sh

set -ex  # stop at errors

# User configuration

usermod -aG sudo andre
usermod -aG docker andre

# Install packages

pacman -Suy
pacman -S --needed \
  wget iwd dhcpcd bash-completion sudo docker man-db man-pages vim tmux git python gcc mlocate \
  dnsutils docker-compose htop lsof inetutils

# Get configuration files from the internet
mkdir -p /usr/share/git-core/contrib/completion
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh > /usr/share/git-core/contrib/completion/git-prompt.sh

# Copy configuration files to home
cp -p shell/.vimrc /home/andre/
cp -p shell/.bashrc /home/andre/
cp -p shell/.tmux.conf /home/andre/
cp -p shell/.dir_colors /home/andre/
cp -p shell/.inputrc /home/andre/.inputrc

# Build dockers

docker-compose build

# Configure and enable services

cp service/docker-compose-app.service /etc/systemd/system/

systemctl enable sshd docker
systemctl start sshd docker
systemctl restart docker-compose-app
