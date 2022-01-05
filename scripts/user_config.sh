#!/bin/sh

set -ex  # stop at errors

# User groups configuration

usermod -aG sudo andre
usermod -aG docker andre

# Copy configuration files to home
cp -p arch/.vimrc /home/andre/
cp -p arch/.bashrc /home/andre/
cp -p arch/.tmux.conf /home/andre/
cp -p arch/.dir_colors /home/andre/
cp -p arch/.inputrc /home/andre/.inputrc
