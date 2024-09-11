#!/bin/bash

sudo wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | sudo apt-key add -
sudo touch /etc/apt/sources.list.d/anydesk-stable.list
sudo chmod 777 /etc/apt/sources.list.d/anydesk-stable.list
echo "deb http://deb.anydesk.com/ all main" > /etc/apt/sources.list.d/anydesk-stable.list
sudo apt update
sudo apt install anydesk -y

sudo echo -e "ad.security.allow_logon_token=true\nad.features.unattended=true" >> ~/.anydesk/user.conf
sudo read -p "Digite a senha do Anydesk: " anypass
sudo echo $anypass | sudo anydesk --set-password _default
sudo sed -i '' -e 's/#  AutomaticLogin/AutomaticLogin/g' -e 's/#WaylandEnable/WaylandEnable/g' /etc/gdm3/custom.conf

sudo dpkg --add-architecture i386
sudo mkdir -pm755 /etc/apt/keyrings
sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources
sudo apt-get update
sudo apt install --install-recommends winehq-stable winetricks -y

cd /opt/wine-stable/bin
winetricks

cd /home/$USER/Downloads
wget https://www.microsip.org/download/MicroSIP-3.21.4.zip
unzip MicroSIP-3.21.4.zip -d /home/$USER/'Área de trabalho'/microsip

reboot
