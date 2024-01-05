#!/bin/bash
fstabFile="/etc/fstab"
sudo apt install -y cifs-utils
sudo mkdir -p /mnt/software /mnt/photos /mnt/videos/movies /mnt/videos/television /mnt/music /mnt/my_backup
sudo chown 497:499 /mnt/videos
#sudo chown 497:499 /mnt/videos/movies /mnt/videos/television
#sudo chown $USER:497 /mnt/music
#sudo chown $USER:498 /mnt/photos /mnt/software /mnt/my_backup
printf "\n%s\t%s\t%s\t%s\t%s\t%s" "#//beelink/shared_data/movies" "/mnt/videos/movies" "cifs" "credentials=/etc/samba/.beelinkcredentials,uid=497,gid=499,iocharset=utf8,file_mode=0664,dir_mode=0775,vers=3.0,noauto" "0" "0" | sudo tee -a /etc/fstab
printf "\n%s\t%s\t%s\t%s\t%s\t%s" "//router/movies" "/mnt/videos/movies" "cifs" "_netdev,credentials=/etc/samba/.tplinkcredentials,uid=497,gid=499,iocharset=utf8,file_mode=0664,dir_mode=0775,vers=2.0,noauto" "0" "0" | sudo tee -a /etc/fstab
sudo mount /mnt/videos/movies
printf "\n%s\t%s\t%s\t%s\t%s\t%s" "#//beelink/shared_data/television" "/mnt/videos/television" "cifs" "credentials=/etc/samba/.beelinkcredentials,uid=497,gid=499,iocharset=utf8,file_mode=0664,dir_mode=0775,vers=3.0,noauto" "0" "0" | sudo tee -a /etc/fstab
printf "\n%s\t%s\t%s\t%s\t%s\t%s" "//router/television" "/mnt/videos/television" "cifs" "_netdev,credentials=/etc/samba/.tplinkcredentials,uid=497,gid=499,iocharset=utf8,file_mode=0664,dir_mode=0775,vers=2.0,noauto" "0" "0" | sudo tee -a /etc/fstab
sudo mount /mnt/videos/television
printf "\n%s\t%s\t%s\t%s\t%s\t%s" "#//beelink/shared_data/music" "/mnt/music" "cifs" "credentials=/etc/samba/.beelinkcredentials,uid=1000,gid=497,iocharset=utf8,file_mode=0664,dir_mode=0775,vers=3.0,noauto" "0" "0" | sudo tee -a /etc/fstab
printf "\n%s\t%s\t%s\t%s\t%s\t%s" "//router/music" "/mnt/music" "cifs" "_netdev,credentials=/etc/samba/.tplinkcredentials,uid=1000,gid=497,iocharset=utf8,file_mode=0664,dir_mode=0775,vers=2.0,noauto" "0" "0" | sudo tee -a /etc/fstab
sudo mount /mnt/music
printf "\n%s\t%s\t%s\t%s\t%s\t%s" "#//beelink/shared_data/software" "/mnt/software" "cifs" "credentials=/etc/samba/.beelinkcredentials,uid=1000,gid=498,iocharset=utf8,file_mode=0664,dir_mode=0775,vers=3.0,noauto" "0" "0" | sudo tee -a /etc/fstab
printf "\n%s\t%s\t%s\t%s\t%s\t%s" "//router/software" "/mnt/software" "cifs" "_netdev,credentials=/etc/samba/.tplinkcredentials,uid=1000,gid=498,iocharset=utf8,file_mode=0664,dir_mode=0775,vers=2.0,noauto" "0" "0" | sudo tee -a /etc/fstab
sudo mount /mnt/software
printf "\n%s\t%s\t%s\t%s\t%s\t%s" "#//beelink/shared_data/photos" "/mnt/photos" "cifs" "credentials=/etc/samba/.beelinkcredentials,uid=1000,gid=498,iocharset=utf8,file_mode=0664,dir_mode=0775,vers=3.0,noauto" "0" "0" | sudo tee -a /etc/fstab
printf "\n%s\t%s\t%s\t%s\t%s\t%s" "//router/photos" "/mnt/photos" "cifs" "_netdev,credentials=/etc/samba/.tplinkcredentials,uid=1000,gid=498,iocharset=utf8,file_mode=0664,dir_mode=0775,vers=2.0,noauto" "0" "0" | sudo tee -a /etc/fstab
sudo mount /mnt/photos
printf "\n%s\t%s\t%s\t%s\t%s\t%s" "//router/sda1" "/mnt/my_backup" "cifs" "_netdev,credentials=/etc/samba/.tplinkcredentials,uid=1000,gid=498,iocharset=utf8,file_mode=0664,dir_mode=0775,vers=2.0,noauto" "0" "0" | sudo tee -a /etc/fstab
#sudo mount /mnt/my_backup

