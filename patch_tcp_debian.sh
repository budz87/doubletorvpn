#!/bin/bash

#Tested on debian 10

apt update
sudo apt -y install software-properties-common dirmngr apt-transport-https lsb-release ca-certificates
sudo add-apt-repository 'deb http://deb.debian.org/debian buster-backports main'
apt update

sudo apt update && sudo apt upgrade
sudo apt install software-properties-common apt-transport-https wget ca-certificates gnupg2 debian-keyring -y
sudo wget -O- https://dl.xanmod.org/gpg.key | gpg --dearmor | sudo tee /usr/share/keyrings/xanmod.gpg
echo 'deb [signed-by=/usr/share/keyrings/xanmod.gpg] http://deb.xanmod.org releases main' | sudo tee /etc/apt/sources.list.d/xanmod-kernel.list
sudo apt update
sudo apt upgrade -y
sudo apt install linux-xanmod-rt -y

#sudo apt-get install linux-image-5.9.0-0.bpo.5-amd64 -y
echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
sudo sysctl -p
#sysctl net.ipv4.tcp_congestion_control
#reboot
