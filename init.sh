#!/bin/bash
cd "$HOME/.dotfiles"
git submodule update --init --recursive
apt install -y --upgrade stow zsh nano tmux
chsh -s $(which zsh) $USER
"$HOME/.dotfiles/scripts/.stow-dotfiles"
