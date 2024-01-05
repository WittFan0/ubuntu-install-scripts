#!/bin/bash
sudo groupadd -g 497 plex
sudo groupadd -g 499 mythtv
sudo useradd -r -u 499 -g 499 -G audio,video,cdrom,dialout,plex mythtv
printf "\n%s\t%s\t%s\t%s" "mythbox:/shared_data/mythtv" "/var/lib/mythtv" "nfs" "rsize=8192,wsize=8192,timeo=14,noauto" | sudo tee -a /etc/fstab && sudo mount /var/lib/mythtv
sudo mkdir -p /srv/mythlinks/television
printf "\n%s\t%s\t%s\t%s" "mythbox:/mythlinks/television" "/srv/mythlinks/television" "nfs" "rsize=8192,wsize=8192,timeo=14,noauto" | sudo tee -a /etc/fstab && sudo mount /srv/mythlinks/television
sudo mkdir -p /srv/mythlinks/movies
printf "\n%s\t%s\t%s\t%s" "mythbox:/mythlinks/movies" "/srv/mythlinks/movies" "nfs" "rsize=8192,wsize=8192,timeo=14,noauto" | sudo tee -a /etc/fstab && sudo mount /srv/mythlinks/movies
sudo mkdir /mnt/movies && sudo chown :499 /mnt/movies && sudo chmod 775 /mnt/movies
printf "\n%s\t%s\t%s\t%s" "mythbox:/shared_data/movies" "/mnt/movies" "nfs" "rsize=8192,wsize=8192,timeo=14,noauto" | sudo tee -a /etc/fstab && sudo mount /mnt/movies
sudo mkdir /mnt/television && sudo chown :499 /mnt/television && sudo chmod 775 /mnt/television
printf "\n%s\t%s\t%s\t%s" "mythbox:/shared_data/television" "/mnt/television" "nfs" "rsize=8192,wsize=8192,timeo=14,noauto" | sudo tee -a /etc/fstab && sudo mount /mnt/television
sudo add-apt-repository -y ppa:mythbuntu/30 && sudo apt update
#export DEBIAN_FRONTEND="noninteractive"
#sudo debconf-set-selections <<< "mythtv-common  mythtv/mysql_mythtv_password    password    $MYSQL_MYTHTV_PASSWD"
#sudo debconf-set-selections <<< "mythtv-common  mythtv/mysql_mythtv_dbname      string  mythconverg"
#sudo debconf-set-selections <<< "mythtv-common  mythtv/mysql_host       string  192.168.40.2"
#sudo debconf-set-selections <<< "mythtv-common  mythtv/mysql_mythtv_user        string  mythtv"
sudo apt install -y mythtv-frontend mythtv-backend libmythtv-perl php-mythtv

#sudo mkdir -p /var/lib/mythtv/tmp && sudo chown 499:499 /var/lib/mythtv/tmp
#sudo mkdir -p /srv/mythlinks/television && sudo chown :499 /srv/mythlinks/television && sudo chmod 775 /srv/mythlinks/television
#sudo mkdir -p /srv/mythlinks/movies && sudo chown :499 /srv/mythlinks/movies && sudo chmod 775 /srv/mythlinks/movies
