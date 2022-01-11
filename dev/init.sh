#!/bin/sh

set -xe

# installation process

echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections 
apt-get update -y 
yes | unminimize
apt-get upgrade -y -o Dpkg::Options::="--force-confold" 
apt-get -y install \
    vim sudo git build-essential autotools-dev automake gdb autoconf plantuml \
    ruby python3 lua5.3 nodejs gcc-avr clang linux-headers-generic man \
    colordiff bc wget bash-completion tmux mlocate htop mc jq tree \
    python3.8-venv
apt-get -y clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

# install libraries

ln -s /usr/bin/python3 /usr/local/bin/python
curl https://bootstrap.pypa.io/get-pip.py | python

# create user dev

useradd --create-home --shell /bin/bash dev 
usermod -p '*' dev 
adduser dev sudo 
echo "dev ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers
chown dev:dev /home/dev

# system configuration

ln -snf /usr/share/zoneinfo/$TZ /etc/localtime
echo $TZ > /etc/timezone
echo "dev" > /etc/hostname
rm -f /etc/service/sshd/down 

mkdir -p /usr/share/git-core/contrib/completion
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh > /usr/share/git-core/contrib/completion/git-prompt.sh
