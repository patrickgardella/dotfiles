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
brew install vim 
brew install vim-gui
brew install /openssh

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install nmap

# Install other useful binaries.
#brew install dark-mode
brew install geoip
brew install git
#brew install git-lfs
brew install gpg
brew install lynx
brew install mosh
#brew install osquery
brew install ssh-copy-id
brew install tmux

brew cask install 1password
brew cask install arduino
brew cask install charles
brew cask install dropbox
brew cask install evernote
brew cask install firefox
#brew cask install gimp
brew cask install google-chrome
brew cask install handbrake
brew cask install iterm2
brew cask install istumbler
brew cask install java
brew cask install kindle
brew cask install lilypond
#brew cask install macvim
#brew cask install manageengine-mibbrowser
brew cask install mountain-duck
#brew cask install odrive
brew cask install onyx
brew cask install skype
brew cask install slack
brew cask install steam
brew cask install tiddlywiki
brew cask install unetbootin
#brew cask install wireshark
brew cask install virtualbox

# Linkapps links apps into the Applications folder
ln -Fs `find /usr/local -name "MacVim.app"` /Applications/MacVim.app
ln -Fs `find /usr/local -name "Wireshark.app"` /Applications/Wireshark.app

# Finally remote casks
brew cask install caskroom/versions/microsoft-remote-desktop-beta

# Remove outdated versions from the cellar.
brew cleanup
