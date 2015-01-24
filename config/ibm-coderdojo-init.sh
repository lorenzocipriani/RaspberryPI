#!/bin/bash

sudo apt-get -y update

sudo apt-get -y dist-upgrade

# TODO: config /etc/networks/interfaces

sudo apt-get -y install vim

sudo apt-get -y install tightvncserver

sudo su -
wget -O - https://raw.githubusercontent.com/lorenzocipriani/RaspberryPI/master/config/vncserver /etc/init.d/vncserver 
chmod ugo+x /etc/init.d/vncserver
update-rc.d vncserver defaults
exit
