#!/bin/bash

# Install apt packages
sudo xargs -a packages.txt apt install

# Install Oh My Zsh and change default shell
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo chsh -s /usr/bin/zsh

# Get dotfiles and create links
git clone https://github.com/denioma/dotfiles.git ~/.dotfiles
~/.dotfiles/linking.sh