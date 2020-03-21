#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils

# Install `wget`
brew install wget

# Install more recent versions of some macOS tools.
brew install vim --enable-gui --with-override-system-vi 

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install nmap

# Install other useful binaries.
brew install git
brew install gpg
brew install lynx
brew install mosh
brew install ssh-copy-id
brew install tmux

brew cask install 1password
brew cask install charles
brew cask install google-chrome
brew cask install iterm2
brew cask install java
brew cask install onyx
brew cask install skype
brew cask install slack
brew cask install virtualbox

brew tap homebrew/cask-fonts
brew cask install font-fira-code

brew install starship
brew install getantibody/tap/antibody

# Linkapps links apps into the Applications folder
ln -Fs `find /usr/local -name "MacVim.app"` /Applications/MacVim.app

# Finally remote casks
brew cask install homebrew/cask-versions/microsoft-remote-desktop-beta

# Remove outdated versions from the cellar.
brew cleanup
