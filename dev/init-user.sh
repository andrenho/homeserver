#!/bin/bash

exec 19>/var/log/init-user.log
BASH_XTRACEFD=19
set -x

# setup SSH key

mkdir -p /home/dev/.ssh 
cat /key.pub > /home/dev/.ssh/authorized_keys
rm -f /key.pub 
chown -R dev:dev /home/dev/.ssh
chmod 700 /home/dev/.ssh 
chmod 600 /home/dev/.ssh/authorized_keys

# copy scripts

cp -n /.bashrc /home/dev/
cp -n /.dir_colors /home/dev/
cp -n /.inputrc /home/dev/
cp -n /.tmux.conf /home/dev/
cp -n /.vimrc /home/dev/
rm -f /.bashrc /.dir_colors /.inputrc /.tmux.conf /.vimrc

# remove this script

rm "$0"
