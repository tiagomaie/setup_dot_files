#!/bin/bash

sudo apt update

# Get TMUX
sudo apt install --assume-yes tmux

# Get Vim
sudo apt install --assume-yes vim

# Install tmux plugin manager
cd ~
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Vim plugin manager install procedure goes directly in .vimrc


