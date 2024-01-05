#!/bin/bash
scriptPath="/usr/local/bin/"
sudo $scriptPath/build-hosts-file.sh
sudo $scriptPath/install-samba-client.sh
#sudo adduser --uid 1001 pam && sudo usermod -a -G family pam
#sudo adduser --uid 1002 calista && sudo usermod -a -G family calista
sudo usermod -a -G mythtv $USER
sudo usermod -a -G family $USER
#sudo systemctl enable fix_shutdown.service
#sudo systemctl enable anydesk.service
mkdir ~/bin && cd ~/bin && ln -s ../.local/share/nemo/actions nemo_actions
mkdir ~/.ssh && sudo chmod 700 ~/.ssh
cd ~/
# For some reason the Live CD session won't execute a "mv" command.
#sudo cp -a /opt/tor-browser_en-US ~/ && gpg --keyserver pool.sks-keyservers.net --recv-keys D1483FA6C3C07136
sudo cp $scriptPath/*.deb ~/Downloads/ && sudo rm -f $scriptPath/*.deb
sudo cp $scriptPath/known_hosts ~/.ssh/ && sudo rm -f $scriptPath/known_hosts
sudo cp $scriptPath/authorized_keys ~/.ssh/ && sudo rm -f $scriptPath/authorized_keys
sudo cp -a $scriptPath/conky ~/.config/ && sudo rm -fr $scriptPath/conky
sudo cp -a $scriptPath/openxcom ~/.local/share/ && sudo rm -fr $scriptPath/openxcom
mkdir ~/.mythtv/ && sudo cp /etc/mythtv/config.xml ~/.mythtv/
sudo chown -R $USER:$GROUP ~
#cd ~/tor-browser_en-US/ && ./start-tor-browser.desktop
# install lastpass
sudo dpkg-reconfigure mysql-server
sudo dpkg-reconfigure mythtv-database
sudo dpkg-reconfigure mythtv-common
sudo dpkg-reconfigure mythweb

