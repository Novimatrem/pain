#!/bin/bash
# install-all-alarms-ever.sh
# apt, snap, flatpak
# also appimages

echo If prompted, enter sudo password:
sudo echo "Okay."

# apt
sudo apt install -y *alarm
sudo apt install -y *alarm*
sudo apt install -y alarm*

sudo apt install -y *clock
sudo apt install -y *clock*
sudo apt install -y clock*
# /apt

# snap
sudo snap install *alarm
sudo snap install *alarm*
sudo snap install alarm*

sudo snap install *clock
sudo snap install *clock*
sudo snap install clock*
# /snap

# flatpak
sudo flatpak install *alarm
sudo flatpak install *alarm*
sudo flatpak install alarm*

sudo flatpak install *clock
sudo flatpak install *clock*
sudo flatpak install clock*
# /flatpak

# appimages
# Install QTalarm
mkdir /home/$(whoami)/Applications
cd /home/$(whoami)/Applications
sudo apt install -y wget
wget https://github.com/antony-jr/QTalarm-AppImage/releases/download/continuous/QTalarm-8028f64-x86_64.AppImage
sudo chmod +x ./QTalarm-8028f64-x86_64.AppImage
# /Install QTalarm
# /appimages
