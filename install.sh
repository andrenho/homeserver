#!/bin/sh

set -e  # stop at errors

# Install packages

pacman-Suy
pacman -S wget iwd dhcpcd bash-completion sudo docker man-db man-pages vim tmux git python gcc

# Enable services

systemctl enable sshd docker
