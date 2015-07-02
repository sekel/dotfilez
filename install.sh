#!/bin/sh

if [ ! -d "$HOME/.dotfilez" ]; then
    echo "Installing dotfiles for the first time"
    git clone https://github.com/seke/dotfilez.git "$HOME/.dotfilez"
    cd "$HOME/.dotfilez"
    [ "$1" = "ask" ] && export ASK="true"
    rake install
else
    echo "ditfilez is already installed"
fi
