#!/bin/bash

echo -e "Run the script as root"
sudo su -

echo -e "\n\nConfigure the nework"
wget -O /etc/network/interfaces https://raw.githubusercontent.com/lorenzocipriani/RaspberryPI/master/etc/network/interfaces

echo -e "\n\nUpdate the system to latest package releases"
apt-get -y update
apt-get -y dist-upgrade

echo -e "\n\nInstall misc tools"
apt-get -y install vim vim-doc vim-scripts
apt-get -y vlc 

echo -e "\n\nInstall remote desktop (VNC and RDP) servers"
apt-get -y install tightvncserver
apt-get -y install xrdp

wget -O /etc/init.d/vncserver https://raw.githubusercontent.com/lorenzocipriani/RaspberryPI/master/etc/init.d/vncserver 
chmod ugo+x /etc/init.d/vncserver
update-rc.d vncserver defaults

echo -e "\n\nInstall development tools"
apt-get -y install -t stable subversion subversion-tools
apt-get -y install -t stable git git-doc git-cvs git-svn git-gui
apt-get -y install -t stable geany
apt-get -y install -t stable diffuse

echo -e "\n\nRestart the network"
service networking restart

echo -e "\n\nLeave the root session"
exit
