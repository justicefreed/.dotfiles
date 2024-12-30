#!/bin/bash
cd ~/.dotfiles
git submodule update --init --recursive
apt install -y --upgrade stow zsh nano xclip tmux
chsh -s $(which zsh) $USER
~/.dotfiles/scripts/.stow-dotfiles
