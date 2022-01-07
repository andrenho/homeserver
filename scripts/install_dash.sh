#!/bin/sh

set -xe

pushd .
cd /opt
sudo curl -LOk https://github.com/afaqurk/linux-dash/archive/master.zip
sudo unzip -o master.zip
sudo rm master.zip
popd

sudo cp arch/dash-app.service /etc/systemd/system/
sudo systemctl enable dash-app
sudo systemctl restart dash-app
sudo systemctl daemon-reload
