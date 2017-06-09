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

# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew tap homebrew/versions
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

# Install `wget` with IRI support.
brew install wget --with-iri

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install vim-gui
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install nmap

# Install other useful binaries.
brew install dark-mode
brew install geoip
brew install git
#brew install git-lfs
brew install gpg
brew install lynx
brew install mosh
brew install osquery
brew install ssh-copy-id
brew install tmux
brew install youtube-dl

brew cask install 1password
brew cask install arduino
brew cask install charles
brew cask install dropbox
brew cask install evernote
brew cask install firefox
brew cask install gimp
brew cask install google-chrome
brew cask install handbrake
brew cask install iterm2
brew cask install istumbler
brew cask install java
brew cask install kindle
brew cask install lilypond
brew cask install macvim
brew cask install manageengine-mibbrowser
brew cask install mountain-duck
brew cask install odrive
brew cask install onyx
brew cask install skype
brew cask install slack
brew cask install steam
brew cask install tiddlywiki
brew cask install unetbootin
brew cask install wireshark
brew cask install virtualbox

# Linkapps links apps into the Applications folder
brew linkapps wireshark
brew linkapps vim

# Finally remote casks
brew cask install caskroom/versions/microsoft-remote-desktop-beta

# Remove outdated versions from the cellar.
brew cleanup
