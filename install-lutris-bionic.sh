#!/bin/bash
printf 'deb http://download.opensuse.org/repositories/home:/strycore/xUbuntu_18.04/ ./' | sudo tee /etc/apt/sources.list.d/lutris.list
wget -q http://download.opensuse.org/repositories/home:/strycore/xUbuntu_18.04/Release.key -O- | sudo apt-key add -
sudo apt update
sudo apt install -y lutris

