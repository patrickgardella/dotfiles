#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

git submodule update --init --recursive

function doIt() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".osx" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "homebrew" \
		--exclude "brew.sh" \
		--exclude "apt.sh" \
		--exclude "bootstrap.sh" \
		--exclude "LICENSE-MIT.txt" \
		-avh --no-perms . ~;
	source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;

# Add local files
touch ~/.bashrc-local

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

# Install pre-requisites for vim-preview
gem install redcarpet
gem install github-markup
