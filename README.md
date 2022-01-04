# homeserver

## Install operating system

1. Create bootable USB stick

- make sure docker is running
- make sure the public SSH key is at `.ssh/id_rsa.pub`

```sh
git clone https://github.com/coreprocess/linux-unattended-installation.git
docker build -t ubuntu-unattended .
docker run --rm -t -v "$HOME/.ssh/id_rsa.pub:/root/.ssh/id_rsa.pub:ro" -v "$(pwd):/iso" ubuntu-unattended 20.04
sudo dd if=ubuntu-20.04-netboot-amd64-unattended.iso of=/dev/sdb bs=4M status=progress
```
