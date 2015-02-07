#!/bin/bash

sudo apt-get -y update

sudo apt-get -y upgrade

# TODO: config /etc/networks/interfaces

echo -e "Install text editors"
sudo apt-get -y install vim

sudo apt-get -y install tightvncserver

sudo apt-get -y install xrdp

echo -e "Install development tools"
sudo apt-get -y install -t stable subversion subversion-tools
sudo apt-get -y install -t stable git git-doc git-cvs git-svn git-gui
sudo apt-get -y install -t stable geany
sudo apt-get -y install -t stable diffuse

sudo su -
wget -O /etc/init.d/vncserver https://raw.githubusercontent.com/lorenzocipriani/RaspberryPI/master/config/vncserver 
chmod ugo+x /etc/init.d/vncserver
update-rc.d vncserver defaults
exit
