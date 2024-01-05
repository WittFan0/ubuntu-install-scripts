#!/bin/bash
echo deb https://pkg.ltec.ch/public/ bionic main | sudo tee /etc/apt/sources.list.d/wsdd.list && \
sudo apt-key adv --fetch-keys https://pkg.ltec.ch/public/conf/ltec-ag.gpg.key && \
sudo apt update && \
sudo apt install wsdd
