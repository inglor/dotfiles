#!/bin/bash

SCRIPT=$(readlink -f "$0")
DIR=$(dirname "$SCRIPT")
cd "$DIR"

echo "Installing .vimrc config"
ln -f -s "$DIR/vimrc" "$HOME/.vimrc"

echo "Installing ccache.conf config"
mkdir -p "$HOME/.ccache"
ln -f -s "$DIR/ccache.conf" "$HOME/.ccache/ccache.conf"

