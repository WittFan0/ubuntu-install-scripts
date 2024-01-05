#!/bin/bash
downloadDir="/opt/"
currentVer="9.0.6"
fileName="tor-browser-linux64-"$currentVer"_en-US.tar.xz"
cd $downloadDir && \
sudo wget https://www.torproject.org/dist/torbrowser/$currentVer/$fileName && \
sudo tar xJpf $fileName -C $downloadDir/ && \
sudo chown -R $USER:$GROUP $downloadDir/tor-browser_en-US && \
cd $downloadDir/tor-browser_en-US/ && ./start-tor-browser.desktop --register-app
sudo rm -f $downloadDir/$fileName
sudo wget https://www.torproject.org/dist/torbrowser/$currentVer/$fileName.asc

