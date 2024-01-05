#!/bin/bash
sudo groupadd -g 497 plex
sudo groupadd -g 499 mythtv && sudo usermod -a -G mythtv $USER
sudo useradd -r -u 499 -g 499 -G audio,video,cdrom,dialout,plex mythtv
sudo ln -s /home/lance/Dropbox/bin/fix_shutdown.sh /usr/local/bin/ && sudo ln -s /home/lance/Dropbox/config/etc/systemd/system/fix_shutdown.service /etc/systemd/system/
sudo mkdir -p /var/lib/mythtv/tmp
sudo mkdir -p /var/lib/mythtv/recordings
sudo chown -R 499:499 /var/lib/mythtv
sudo setfacl -m "default:group::rw" /var/lib/mythtv/recordings

sudo mkdir -p /srv/mythlinks/television && \
sudo chown :499 /srv/mythlinks/television && \
sudo chmod 775 /srv/mythlinks/television

sudo mkdir -p /srv/mythlinks/movies && \
sudo chown :499 /srv/mythlinks/movies && \
sudo chmod 775 /srv/mythlinks/movies

sudo mkdir -p /srv/nfs4/mythtv
printf "\n%s\t%s\t%s\t%s\t%s\t%s" "/var/lib/mythtv" "/srv/nfs4/mythtv" "none" "bind" "0" "0" | sudo tee -a /etc/fstab > /dev/null && \
sudo mount /srv/nfs4/mythtv

sudo mkdir -p /srv/nfs4/television
printf "\n%s\t%s\t%s\t%s\t%s\t%s" "/mnt/videos/television" "/srv/nfs4/television" "none" "bind" "0" "0" | sudo tee -a /etc/fstab > /dev/null && \
sudo mount /srv/nfs4/mythtv

sudo mkdir -p /srv/nfs4/movies
printf "\n%s\t%s\t%s\t%s\t%s\t%s" "/mnt/videos/movies" "/srv/nfs4/movies" "none" "bind" "0" "0" | sudo tee -a /etc/fstab > /dev/null && \
sudo mount /srv/nfs4/mythtv

sudo mkdir -p /srv/nfs4/mythlinks
printf "\n%s\t%s\t%s\t%s\t%s\t%s" "/srv/mythlinks" "/srv/nfs4/mythlinks" "none" "bind" "0" "0" | sudo tee -a /etc/fstab > /dev/null && \
sudo mount /srv/nfs4/mythlinks

sudo mkdir -p /etc/exports.d
sudo touch /etc/exports.d/mythtv.exports
printf "\n%s\t%s" "/srv/nfs4/" "192.168.40.5(rw,sync,no_subtree_check,crossmnt,fsid=0)" | sudo tee -a /etc/exports.d/mythtv.exports > /dev/null
printf "\n%s\t%s" "/srv/nfs4/mythtv" "192.168.40.5(rw,sync,no_subtree_check)" | sudo tee -a /etc/exports.d/mythtv.exports > /dev/null
printf "\n%s\t%s" "/srv/nfs4/television" "192.168.40.5(rw,sync,no_subtree_check)" | sudo tee -a /etc/exports.d/mythtv.exports > /dev/null
printf "\n%s\t%s" "/srv/nfs4/movies" "192.168.40.5(rw,sync,no_subtree_check)" | sudo tee -a /etc/exports.d/mythtv.exports > /dev/null
printf "\n%s\t%s" "/srv/nfs4/mythlinks" "192.168.40.5(rw,sync,no_subtree_check)" | sudo tee -a /etc/exports.d/mythtv.exports > /dev/null

sudo add-apt-repository -y ppa:mythbuntu/30 && sudo apt update
#sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password $MYSQL_ROOT_PASSWD"
#sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $MYSQL_ROOT_PASSWD"
#sudo debconf-set-selections <<< "mythtv-common  mythtv/mysql_mythtv_password    password    $MYSQL_MYTHTV_PASSWD"
#sudo debconf-set-selections <<< "mythtv-database        mythtv/mysql_admin_password     password        $MYSQL_ROOT_PASSWD"
#sudo debconf-set-selections <<< "mythweb        mythweb/password        password        $MYTHWEB_PASSWD"
#sudo debconf-set-selections <<< "mythtv-common  mythtv/mysql_mythtv_dbname      string  mythconverg"
#sudo debconf-set-selections <<< "mythtv-database        mythtv/mysql_admin_user string  debian-sys-maint"
#sudo debconf-set-selections <<< "mythtv-database        mythtv/public_bind      boolean true"
#sudo debconf-set-selections <<< "mythweb        mythweb/username        string  lance"
#sudo debconf-set-selections <<< "mythtv-common  mythtv/mysql_host       string  localhost"
#sudo debconf-set-selections <<< "mythweb        mythweb/enable  boolean true"
#sudo debconf-set-selections <<< "mythweb        mythweb/only    boolean false"
#sudo debconf-set-selections <<< "mythtv-common  mythtv/mysql_mythtv_user        string  mythtv"
sudo apt install -y mythtv libmythtv-perl mythweb ffmpeg pwgen mediainfo dvb-tools nfs-kernel-server

