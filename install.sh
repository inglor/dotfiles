#!/bin/bash

install_dot_file(){
  echo "Installing dot file '$2/$1' in '${HOME}/.$1' directory"
  ln -s "$2/$1" "${HOME}/.$1"
}

SCRIPT=$(readlink -f "$0")
DIR=$(dirname "$SCRIPT")
cd "$DIR"

install_dot_file vimrc $DIR
