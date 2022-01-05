#!/bin/sh

read -p 'Username: ' user

echo -n "$user:" >> proxy/config/.htpasswd
openssl passwd -apr1 >> proxy/config/.htpasswd
