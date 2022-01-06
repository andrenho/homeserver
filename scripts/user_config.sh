#!/bin/sh

set -ex  # stop at errors

if [[ $EUID -eq 0 ]]; then
  echo "This script must NOT be run as root" 1>&2
  exit 1
fi

# User groups configuration

sudo usermod -aG sudo andre
sudo usermod -aG docker andre

# Copy configuration files to home
cp -p arch/.vimrc /home/andre/
cp -p arch/.bashrc /home/andre/
cp -p arch/.tmux.conf /home/andre/
cp -p arch/.dir_colors /home/andre/
cp -p arch/.inputrc /home/andre/.inputrc

# Remove useless directories
rm -rf ~/Desktop ~/Documents ~/Downloads ~/Music ~/Pictures ~/Public ~/Templates ~/Videos
