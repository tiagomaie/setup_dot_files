#!/bin/bash

sudo apt update

# Get TMUX
sudo apt install --assume-yes tmux

# Get Vim
sudo apt install --assume-yes vim
# Vim plugin manager install procedure goes directly in .vimrc

# Get dotfiles
wget "https://github.com/tiagomaie/setup_dot_files/blob/master/.vimrc" -O "~/.vimrc" # within Vim do ':PlugInstall' to install plugins
wget "https://github.com/tiagomaie/setup_dot_files/blob/master/.bashrc" -O "~/.bashrc"
# wget "https://github.com/tiagomaie/setup_dot_files/blob/master/.tmux.conf" -O "~/.tmux.conf"

# Install tmux plugin manager
# cd ~
# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# For TMUX, now using gpakosz config
cd ~
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .


# Setting up code-minimap package for Vim
TEMP_DEB="$(mktemp)" &&
wget -O "$TEMP_DEB" 'https://github.com/wfxr/code-minimap/releases/download/v0.6.1/code-minimap_0.6.1_amd64.deb' &&
sudo dpkg -i "$TEMP_DEB"
rm -f "$TEMP_DEB"


