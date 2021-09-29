#!/bin/bash

ID_LIKE=`cat /etc/os-release | egrep "^ID_LIKE=\w+" | cut -c 9-`

if [[ $ID_LIKE != *"debian"* ]]; then
    echo "This script is meant for Ubuntu only (so far!)"
    exit 1
fi

# Install apt packages
sudo xargs -a packages.txt apt install

# Install Oh My Zsh and change default shell
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo chsh -s /usr/bin/zsh

# Get dotfiles and create links
git clone https://github.com/denioma/dotfiles.git ~/.dotfiles
~/.dotfiles/linking.sh