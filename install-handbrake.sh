#!/bin/bash
sudo add-apt-repository -y ppa:stebbins/handbrake-releases && \
sudo apt update && \
sudo apt install -y handbrake-gtk handbrake-cli
