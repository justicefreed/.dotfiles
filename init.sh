#!/bin/bash

cd ~/.dotfiles || exit
git submodule update --init --recursive

command -v sudo || apt install -y sudo

if command -v apt ; then
    sudo apt install -y --upgrade stow zsh nano tmux
elif command -v brew ; then
    brew install -y stow zsh nano tmux
fi

if command -v apt ; then
    sudo apt install -y --upgrade lsd || sudo snap install lsd
elif command -v brew ; then
    brew install -y lsd
fi

chsh -s "$(which zsh)" "$USER"

zsh ~/.dotfiles/local/.local/bin/stow-dotfiles
