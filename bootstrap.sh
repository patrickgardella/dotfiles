#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

git submodule update --init --recursive

# Add local files
touch ~/.bashrc-local
mkdir -p ~/.config

# Handle some basic Git configuration
git config --global push.default simple
git config --global core.editor "vim"

# Execute platform specific configs
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
    /bin/bash apt.sh
elif [[ "$unamestr" == 'Darwin' ]]; then
    /bin/bash brew.sh
fi

