#!/bin/bash
scriptPath="/usr/local/bin/install-scripts/"
sudo groupadd -g 498 family
sudo groupadd -g 499 mythtv
sudo curl -o /etc/udev/rules.d/51-these-are-not-joysticks.rules https://raw.githubusercontent.com/denilsonsa/udev-joystick-blacklist/master/51-these-are-not-joysticks.rules
sudo systemctl enable fix_shutdown.service
cp -a /media/$USER/home/lance/bin ~/ && cd ~/bin/ && ln -s ../.local/share/nemo/actions nemo_actions && ./install-scripts/build-hosts-file.sh
cd ~/
sudo build-hosts-file.sh
printf "\n%s\t%s\t%s\t%s\t%s\t%s" "#//router/movies" "/mnt/shared_data/movies" "cifs" "_netdev,credentials=/etc/samba/.tplinkcredentials,uid=1000,gid=497,iocharset=utf8,file_mode=0664,dir_mode=0775,vers=2.0,noauto" "0" "0" | sudo tee -a /etc/fstab > /dev/null
printf "\n%s\t%s\t%s\t%s\t%s\t%s" "#//router/television" "/mnt/shared_data/television" "cifs" "_netdev,credentials=/etc/samba/.tplinkcredentials,uid=1000,gid=497,iocharset=utf8,file_mode=0664,dir_mode=0775,vers=2.0,noauto" "0" "0" | sudo tee -a /etc/fstab > /dev/null
printf "\n%s\t%s\t%s\t%s\t%s\t%s" "#//router/music" "/mnt/shared_data/music" "cifs" "_netdev,credentials=/etc/samba/.tplinkcredentials,uid=1000,gid=498,iocharset=utf8,file_mode=0664,dir_mode=0775,vers=2.0,noauto" "0" "0" | sudo tee -a /etc/fstab > /dev/null
printf "\n%s\t%s\t%s\t%s\t%s\t%s" "#//router/software" "/mnt/shared_data/software" "cifs" "_netdev,credentials=/etc/samba/.tplinkcredentials,uid=1000,gid=498,iocharset=utf8,file_mode=0664,dir_mode=0775,vers=2.0,noauto" "0" "0" | sudo tee -a /etc/fstab > /dev/null
printf "\n%s\t%s\t%s\t%s\t%s\t%s" "#//router/photos" "/mnt/shared_data/photos" "cifs" "_netdev,credentials=/etc/samba/.tplinkcredentials,uid=1000,gid=498,iocharset=utf8,file_mode=0664,dir_mode=0775,vers=2.0,noauto" "0" "0" | sudo tee -a /etc/fstab > /dev/null
sudo adduser --uid 1001 pam && sudo usermod -a -G family pam
sudo adduser --uid 1002 calista && sudo usermod -a -G family calista
sudo usermod -a -G mythtv $USER
sudo usermod -a -G family $USER
sudo add-apt-repository -y ppa:duplicity-team/ppa
sudo add-apt-repository -y ppa:dieterbaum/qt5-fsarchiver
sudo apt update -y
sudo apt dist-upgrade -y
sudo apt install -y gdebi-core firejail fonts-crosextra-carlito fonts-crosextra-caladea conky-all p7zip-full xorriso htop ntp python-gpg wakeonlan apt-transport-https xsane xsltproc ssh openssh-server
sudo apt install -y duplicity python-paramiko python-gobject-2 python-gi python-urllib3 python-oauthlib python-boto ncftp python-cloudfiles lftp python-gdata tahoe-lafs python-swiftclient gddrescue fsarchiver
sudo apt install -y mint-meta-codecs mediainfo ffmpeg lame vlc
#sudo apt install -y virtualbox virtualbox-ext-pack virtualbox-qt
#sudo apt install -y steam playonlinux libc6-i386 lib32gcc1 openttd wesnoth freeciv freeciv-client-extras freeciv-sound-standard freeciv-server freepats fluid-soundfont-gm
#sudo apt install -y libimage-exiftool-perl exiv2 geeqie
sudo apt install -y nemo-dropbox nemo-image-converter nemo-compare nemo-filename-repairer nemo-pastebin nemo-seahorse nemo-gtkhash
#$scriptPath/install-chrome.sh
$scriptPath/install-tor-browser.sh && gpg --keyserver pool.sks-keyservers.net --recv-keys D1483FA6C3C07136
#$scriptPath/install-lutris-bionic.sh
$scriptPath/install-handbrake.sh
#$scriptPath/install-mythtv-frontend.sh
#$scriptPath/install-mythtv-slave.sh
$scriptPath/install-mythtv-master.sh
#$scriptPath/install-plexserver.sh
$scriptPath/install-samba-client.sh
sudo flatpak install -y flathub org.avidemux.Avidemux
/usr/bin/firefox -new-tab -url https://anydesk.com/download?os=linux -new-tab -url https://lastpass.com/misc_download2.php &
