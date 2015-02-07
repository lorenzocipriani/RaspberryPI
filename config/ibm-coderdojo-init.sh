#!/bin/bash

echo -e "Run the script as root"
sudo su -

echo -e "\n\nUpdate the system to latest package releases"
apt-get -y update
apt-get -y dist-upgrade

# TODO: config /etc/networks/interfaces

echo -e "\n\nInstall text editors"
apt-get -y install vim

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

echo -e "\n\nLeave the root session"
exit
return 0
