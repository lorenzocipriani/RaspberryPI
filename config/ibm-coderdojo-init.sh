#!/bin/bash

echo -e "Run the script as root"
#sudo su -
if [ ! -f "/root/ibm-coderdojo-init.sh" ]
then
  echo "wget --no-check-certificate -O - https://raw.githubusercontent.com/lorenzocipriani/RaspberryPI/master/config/ibm-coderdojo-init.sh | /bin/bash" > /root/ibm-coderdojo-init.sh
  chmod ug+x /root/ibm-coderdojo-init.sh
fi

echo -e "Configure pi default password"
echo "pi:raspberry" | chpasswd

echo -e "\n\nConfigure the network"
wget -O /etc/network/interfaces https://raw.githubusercontent.com/lorenzocipriani/RaspberryPI/master/etc/network/interfaces
if [ ! -f "/etc/ssh/sshd_config.orig" ]
then
  cp /etc/ssh/sshd_config /etc/ssh/sshd_config.orig
fi
sed \
  -e "s|#X11Forwarding|X11Forwarding/|" \
  -e "s|X11Forwarding no|X11Forwarding yes/|" \
  -e "s|#X11DisplayOffset|X11DisplayOffset/|" \
  -e "s|#TCPKeepAlive|TCPKeepAlive/|" \
  -e "s|TCPKeepAlive no|TCPKeepAlive yes/|" \
  /etc/ssh/sshd_config.orig > /etc/ssh/sshd_config

echo -e "\n\nUpdate the system to latest package releases"
#apt-get -y update
#apt-get -y dist-upgrade

echo -e "\n\nInstall small network infrastructure: DNS, DHCP, Router Advertisement and Network Boot"
apt-get -y install dnsmasq
wget -O /etc/dnsmasq.d/coderdojo.conf https://raw.githubusercontent.com/lorenzocipriani/RaspberryPI/master/etc/dnsmasq.d/coderdojo.conf
if [ ! -f "/etc/dnsmasq.conf.orig" ]
then
  cp /etc/dnsmasq.conf /etc/dnsmasq.conf.orig
fi
sed \
  -e "s|#conf-dir|conf-dir/|" \
  /etc/dnsmasq.conf.orig > /etc/dnsmasq.conf

echo -e "\n\nInstall misc tools"
apt-get -y install vim vim-doc vim-scripts
apt-get -y install vlc

echo -e "\n\nInstall Python libraries"
apt-get -y install python-picamera python-picamera-docs python-rpi.gpio

echo -e "\n\nInstall remote desktop (VNC and RDP) servers"
apt-get -y install tightvncserver
if [ ! -d "/etc/vncserver" ]
then
  mkdir /etc/vncserver
fi
wget -O /etc/vncserver/vncserver.conf https://raw.githubusercontent.com/lorenzocipriani/RaspberryPI/master/etc/vncserver/vncserver.conf
wget -O /etc/init.d/vncserver https://raw.githubusercontent.com/lorenzocipriani/RaspberryPI/master/etc/init.d/vncserver 
chmod ugo+x /etc/init.d/vncserver
update-rc.d vncserver defaults

echo -e "\n\nConfigure the root password for VNC"
if [ ! -d "/root/.vnc" ]
then
  mkdir /root/.vnc
fi
echo "coderdojo1" | vncpasswd -f > /root/.vnc/passwd

echo -e "\n\nConfigure the pi password for VNC"
if [ ! -d "/home/pi/.vnc" ]
then
  mkdir /home/pi/.vnc
fi
echo "coderdojo1" | vncpasswd -f > /home/pi/.vnc/passwd

apt-get -y install xrdp

echo -e "\n\nInstall development tools"
apt-get -y install -t stable subversion subversion-tools
apt-get -y install -t stable git git-doc git-cvs git-svn git-gui
apt-get -y install -t stable geany
apt-get -y install -t stable diffuse

echo -e "\n\nClean the package repository"
apt-get clean

wget --no-check-certificate -O - https://raw.githubusercontent.com/lorenzocipriani/RaspberryPI/master/config/ibm-coderdojo-projects.sh | /bin/bash

echo -e "\n\nRestart the network"
#service networking restart

echo -e "\n\nLeave the root session"
#exit
