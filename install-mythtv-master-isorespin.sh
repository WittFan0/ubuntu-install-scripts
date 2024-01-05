#!/bin/bash
sudo groupadd -g 497 plex
sudo groupadd -g 499 mythtv && sudo usermod -a -G mythtv $USER
sudo useradd -r -u 499 -g 499 -G audio,video,cdrom,dialout,plex mythtv
sudo mkdir -p /var/lib/mythtv/tmp && sudo chown -R 499:499 /var/lib/mythtv
sudo mkdir -p /srv/mythlinks/television && sudo chown :499 /srv/mythlinks/television && sudo chmod 775 /srv/mythlinks/television
sudo mkdir -p /srv/mythlinks/movies && sudo chown :499 /srv/mythlinks/movies && sudo chmod 775 /srv/mythlinks/movies
export DEBIAN_FRONTEND="noninteractive"
#sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password $MYSQL_ROOT_PASSWD"
#sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $MYSQL_ROOT_PASSWD"
sudo debconf-set-selections <<< "mythtv-common	mythtv/mysql_mythtv_password	password    $MYSQL_MYTHTV_PASSWD"
#sudo debconf-set-selections <<< "mythtv-database	mythtv/mysql_admin_password	password	$MYSQL_ROOT_PASSWD"
sudo debconf-set-selections <<< "mythweb	mythweb/password	password	$MYTHWEB_PASSWD"
sudo debconf-set-selections <<< "mythtv-common	mythtv/mysql_mythtv_dbname	string	mythconverg"
#sudo debconf-set-selections <<< "mythtv-database	mythtv/mysql_admin_user	string	debian-sys-maint"
sudo debconf-set-selections <<< "mythtv-database	mythtv/public_bind	boolean	true"
sudo debconf-set-selections <<< "mythweb	mythweb/username	string	lance"
sudo debconf-set-selections <<< "mythtv-common	mythtv/mysql_host	string	localhost"
sudo debconf-set-selections <<< "mythweb	mythweb/enable	boolean	true"
sudo debconf-set-selections <<< "mythweb	mythweb/only	boolean	false"
sudo debconf-set-selections <<< "mythtv-common	mythtv/mysql_mythtv_user	string	mythtv"
sudo apt install -y mythtv libmythtv-perl mythweb
