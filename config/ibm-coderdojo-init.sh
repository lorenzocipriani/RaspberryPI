#!/bin/bash

echo -e "Run the script as root"
sudo su -

echo -e "\n\nConfigure the nework"
wget -O /etc/network/interfaces https://raw.githubusercontent.com/lorenzocipriani/RaspberryPI/master/etc/network/interfaces

echo -e "\n\nUpdate the system to latest package releases"
#apt-get -y update
#apt-get -y dist-upgrade

echo -e "\n\nInstall misc tools"
apt-get -y install vim vim-doc vim-scripts
apt-get -y install vlc

echo -e "\n\nInstall Python libraries"
apt-get -y install python-picamera python-picamera-docs python-rpi.gpio

echo -e "\n\nInstall remote desktop (VNC and RDP) servers"
apt-get -y install tightvncserver
mkdir /etc/vncserver
wget -O /etc/vncserver/vncserver.conf https://raw.githubusercontent.com/lorenzocipriani/RaspberryPI/master/etc/vncserver/vncserver.conf
wget -O /etc/init.d/vncserver https://raw.githubusercontent.com/lorenzocipriani/RaspberryPI/master/etc/init.d/vncserver 
chmod ugo+x /etc/init.d/vncserver
update-rc.d vncserver defaults

if [ ! -d "~/.vnc" ]
then
  mkdir ~/.vnc
fi
echo "coderdojo1" | vncpasswd -f > ~/.vnc/passwd

apt-get -y install xrdp


echo -e "\n\nInstall development tools"
apt-get -y install -t stable subversion subversion-tools
apt-get -y install -t stable git git-doc git-cvs git-svn git-gui
apt-get -y install -t stable geany
apt-get -y install -t stable diffuse

echo -e "\n\nRestart the network"
service networking restart

echo -e "\n\nClean the package repository"
apt-get clean

echo -e "\n\nLeave the root session"
exit

echo -e "\n\nConfigure the pi password for VNC"
if [ ! -d "~/.vnc" ]
then
  mkdir ~/.vnc
fi
echo "coderdojo1" | vncpasswd -f > ~/.vnc/passwd

wget --no-check-certificate -O - https://raw.githubusercontent.com/lorenzocipriani/RaspberryPI/master/config/ibm-coderdojo-projects.sh | /bin/bash
