#!/bin/bash

echo -e "\n\nInstall PicoBorg Reverse"
mkdir ~/picoborgrev
cd ~/picoborgrev
wget http://www.piborg.org/downloads/picoborgrev/examples.zip
unzip examples.zip
chmod +x install.sh
./install.sh
cd ~

echo -e "\n\nInstall HC-SR04 Ultrasonic Range Sensor"


echo -e "\n\nInstall HC-SR501 PIR Infrared Motion Sensor"
