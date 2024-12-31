#!/bin/bash
cd ~/.dotfiles
git submodule update --init --recursive
apt install -y --upgrade stow lsd zsh nano xclip tmux
chsh -s $(which zsh) $USER
~/.dotfiles/scripts/stow-dotfiles
stow -d ~/.dotfiles/ -t /usr/local/bin scripts
