#!/bin/bash

cd ~/.dotfiles || exit
git submodule update --init --recursive

command -v sudo || apt install -y sudo

if command -v apt ; then
    sudo apt install -y --upgrade stow zsh nano tmux
    ln -sf /usr/share/nano/ "$HOME/.nanosyntax"
elif command -v brew ; then
    brew install stow zsh nano tmux
    ln -sf "$(brew --prefix nano)/share/nano/" "$HOME/.nanosyntax"
fi

if command -v apt ; then
    sudo apt install -y --upgrade lsd || sudo snap install lsd
elif command -v brew ; then
    brew install lsd
fi

[[ "$SHELL" =~ "zsh" ]] || chsh -s "$(which zsh)" "$USER"

zsh ~/.dotfiles/local/.local/bin/stow-dotfiles
