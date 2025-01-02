#!/bin/bash
cd ~/.dotfiles
git submodule update --init --recursive
command -v sudo || apt install -y sudo
sudo apt install -y --upgrade stow lsd zsh nano tmux
chsh -s $(which zsh) $USER
~/.dotfiles/scripts/stow-dotfiles
stow -d ~/.dotfiles/ -t /usr/local/bin scripts
