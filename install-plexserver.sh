#!/bin/bash
sudo groupadd -g 497 plex
sudo useradd -r -u 497 -g 497 -G video plex
sudo mkdir -p /mnt/music && sudo chown $USER:$GROUP /mnt/music
sudo mkdir -p /mnt/photos && sudo chown $USER:$GROUP /mnt/photos
sudo mkdir -p /mnt/videos && sudo chown -R 497:497 /mnt/videos && sudo chmod 775 /mnt/videos
sudo mkdir -p /mnt/videos/movies && sudo chown -R 497:497 /mnt/videos/movies && sudo chmod 775 /mnt/videos/movies
sudo mkdir -p /mnt/videos/television && sudo chown -R 497:497 /mnt/videos/television && sudo chmod 775 /mnt/videos/television

sudo mkdir -p /srv/nfs4/music
printf "\n%s\t%s\t%s\t%s\t%s\t%s" "/mnt/music" "/srv/nfs4/music" "none" "bind" "0" "0" | sudo tee -a /etc/fstab > /dev/null && \
sudo mount /srv/nfs4/music

sudo mkdir -p /srv/nfs4/photos
printf "\n%s\t%s\t%s\t%s\t%s\t%s" "/mnt/photos" "/srv/nfs4/photos" "none" "bind" "0" "0" | sudo tee -a /etc/fstab > /dev/null && \
sudo mount /srv/nfs4/photos

sudo mkdir -p /srv/nfs4/videos
printf "\n%s\t%s\t%s\t%s\t%s\t%s" "/mnt/videos" "/srv/nfs4/videos" "none" "bind" "0" "0" | sudo tee -a /etc/fstab > /dev/null && \
sudo mount /srv/nfs4/videos

sudo mkdir -p /etc/exports.d
sudo touch /etc/exports.d/plex.exports
printf "\n%s\t%s" "/srv/nfs4/" "192.168.40.0/24(rw,sync,no_subtree_check,crossmnt,fsid=0)" | sudo tee -a /etc/exports.d/plex.exports > /dev/null
printf "\n%s\t%s" "/srv/nfs4/music" "192.168.40.0/24(rw,sync,no_subtree_check)" | sudo tee -a /etc/exports.d/plex.exports > /dev/null
printf "\n%s\t%s" "/srv/nfs4/photos" "192.168.40.0/24(rw,sync,no_subtree_check)" | sudo tee -a /etc/exports.d/plex.exports > /dev/null
printf "\n%s\t%s" "/srv/nfs4/videos" "192.168.40.0/24(rw,sync,no_subtree_check)" | sudo tee -a /etc/exports.d/plex.exports > /dev/null

#cd /tmp
#echo deb https://downloads.plex.tv/repo/deb ./public main | sudo tee /etc/apt/sources.list.d/plexmediaserver.list && \
#wget -q https://downloads.plex.tv/plex-keys/PlexSign.key -O - | sudo apt-key add - && \
#sudo apt-get update && \
#sudo apt install plexmediaserver
curl -o /usr/local/bin/plexmediaserver.deb https://downloads.plex.tv/plex-media-server-new/1.18.2.2058-e67a4e892/debian/plexmediaserver_1.18.2.2058-e67a4e892_amd64.deb
sudo apt deb /usr/local/bin/plexmediaserver.deb
sudo rm -f /usr/local/bin/plexmediaserver.deb

