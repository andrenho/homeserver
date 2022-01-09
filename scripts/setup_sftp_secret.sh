#!/bin/sh

mkdir -p ~/secrets
echo -n Password:
read -s password
echo
encrypted_password=$(echo -n $password | docker run -i --rm atmoz/makepasswd --crypt-md5 --clearfrom=- | tr -s ' ' | cut -d ' ' -f 2)
echo andre_nho:$encrypted_password:e:$(id -u):$(id -g) > ~/secrets/sftp-users.conf
