#!/bin/bash

PROJECTS=~/projects
GITHUB_HOME="https://raw.githubusercontent.com/lorenzocipriani/RaspberryPI"

echo -e "\n\nInstall PicoBorg Reverse"
if [ ! -d "${PROJECTS}/picoborgrev" ]
then
  mkdir -p $PROJECTS/picoborgrev
fi
cd $PROJECTS/picoborgrev
wget http://www.piborg.org/downloads/picoborgrev/examples.zip
unzip examples.zip
chmod +x install.sh
./install.sh
cd ~

echo -e "\n\nInstall HC-SR04 Ultrasonic Range Sensor"
if [ ! -d "${PROJECTS}/rangesensor_hc-sr04" ]
then
  mkdir -p $PROJECTS/rangesensor_hc-sr04
fi
wget -O $PROJECTS/rangesensor_hc-sr04/range_sensor.py $GITHUB_HOME/master/projects/rangesensor_hc-sr04/range_sensor.py

echo -e "\n\nInstall HC-SR501 PIR Infrared Motion Sensor"
if [ ! -d "${PROJECTS}/motionsensor_hc-sr501" ]
then
  mkdir -p $PROJECTS/motionsensor_hc-sr501
fi
wget -O $PROJECTS/motionsensor_hc-sr501/motion_sensor.py $GITHUB_HOME/master/projects/motionsensor_hc-sr501/motion_sensor.py
