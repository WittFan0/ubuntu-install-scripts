#!/bin/bash
sudo groupadd -g 499 mythtv
sudo useradd -r -u 499 -g 499 -G audio,video,cdrom,dialout mythtv
sudo add-apt-repository -y ppa:mythbuntu/30 && sudo apt update
sudo apt install -y mythtv-frontend
sudo apt install --fix-broken -y

