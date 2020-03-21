#!/bin/bash

sudo apt-get -y --force-yes update && sudo apt-get -y --force-yes upgrade

sudo apt-get -y install \
    avahi-daemon \
    curl \
    mosh \
    tmux \
    vim \
    whois \
    fonts-firacode
