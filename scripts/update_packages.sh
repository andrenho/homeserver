#!/bin/sh

set -ex  # stop at errors

if [[ $EUID -eq 0 ]]; then
  echo "This script must NOT be run as root" 1>&2
  exit 1
fi

# Install packages
sudo pacman -Suy
sudo pacman -S --noconfirm --needed \
  wget iwd dhcpcd bash-completion sudo docker man-db man-pages vim tmux git python gcc mlocate \
  dnsutils docker-compose htop lsof inetutils unzip mc base-devel jq tree subdl python2 dhcping

# Install yay, if not installed
if ! command -v yay &> /dev/null
then
  # Install yay
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si --noconfirm
  cd ..
  rm -rf yay
  sudo pacman --noconfirm -Rs go
  yay --save --answerdiff None --answerclean None --removemake

  # Install yay packages
  yay -S aws-cli-v2-bin
fi

# Update yay packages
yay -Sua

# Get configuration files from the internet
sudo mkdir -p /usr/share/git-core/contrib/completion
sudo sh -c 'curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh > /usr/share/git-core/contrib/completion/git-prompt.sh'

# Start services
sudo systemctl enable sshd docker
sudo systemctl start sshd docker

# Install scripts
sudo cp scripts/subdl_dir.sh /usr/local/bin
