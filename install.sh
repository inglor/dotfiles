#!/bin/bash

install_dot_file(){
  echo "Installing dot file $1 in ${HOME} directory"
  ln -s $1 "${HOME}/.$1"
}

SCRIPT=$(readlink -f "$0")
DIR=$(dirname "$SCRIPT")
cd "$DIR"

install_dot_file vimrc
