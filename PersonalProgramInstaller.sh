#!/bin/bash
# Update all current programs
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
# Start installing new programs. SFTP client, RDC Client, Desktop Environment. Uninstalls Unity and related packages
sudo apt install filezilla -y
sudo apt install remmina -y
sudo apt install cinnamon -y
sudo apt-get purge unity -y
sudo apt-get auto-remove -y
sudo mkdir tmp
cd /tmp
# Downloads Jetbrains Toolbox and opens it for you to install a program.
wget https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.8.3678.tar.gz
tar -xfz jetbrains-toolbox-1.8.3678.tar.gz
cd jetbrains-toolbox-1.8.3678
jetbrains-toolbox
# Discord Installer
cd /tmp
wget https://discordapp.com/api/download?platform=linux&format=deb
deb -y
# Google Chrome Installer (Yes I know firefox is in Ubuntu by default but most schools/workplaces test their websites and guarentee compatability with it.)
cd /tmp
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
deb google-chrome-stable_current_amd64.deb -y

