#!/bin/sh

set -x

mkdir ~/.ssh 
cat /tmp/key.pub >> ~/.ssh/authorized_keys && rm -f /tmp/key.pub 
chmod 700 ~/.ssh 
chmod 600 ~/.ssh/authorized_keys
