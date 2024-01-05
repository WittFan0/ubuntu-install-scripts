#!/bin/bash
echo deb https://deb.torproject.org/torproject.org bionic main | sudo tee /etc/apt/sources.list.d/tor-browser.list && \
gpg --keyserver keys.gnupg.net --recv 886DDD89 && \
gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | sudo apt-key add - && \
sudo apt update && \
sudo apt install apt-transport-https tor deb.torproject.org-keyring
