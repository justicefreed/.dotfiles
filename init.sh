#!/bin/bash
cd ~/.dotfiles
git submodule update --init --recursive
command -v sudo || apt install -y sudo
sudo apt install -y --upgrade stow zsh nano tmux || brew install -y stow zsh nano tmux
sudo apt install -y --upgrade lsd || sudo snap install lsd || brew install lsd
chsh -s $(which zsh) $USER
~/.dotfiles/scripts/stow-dotfiles
stow -d ~/.dotfiles/ -t /usr/local/bin scripts
