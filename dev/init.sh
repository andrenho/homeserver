#!/bin/sh

set -x

# installation process

echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections 
apt-get update -y 
apt-get upgrade -y -o Dpkg::Options::="--force-confold" 
apt-get -y install \
    vim sudo git build-essential autotools-dev automake gdb autoconf plantuml \
    ruby python3 lua5.3 nodejs gcc-avr clang linux-headers-generic 
apt-get -y clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

# create user dev

useradd --create-home --shell /bin/bash dev 
usermod -p '*' dev 
adduser dev sudo 
echo "dev ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers

# setup services

echo "dev" > /etc/hostname
rm -f /etc/service/sshd/down 
