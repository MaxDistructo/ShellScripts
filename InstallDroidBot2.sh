#!/bin/bash
sudo apt-get install openjdk-8-jre #Installs openJDK 8 which the bot is based off of
mkdir DroidBot2 #Makes Directory for Bot
cd DroidBot2 
wget https://maxdistructo.github.io/droidbot2/downloads/latest/droidbot2.jar #Downloads latest version of bot from website.
mkdir droidbot

x-terminal-emulator -e /usr/bin/nano 
read -n "Please change the config values with your key and press any key to continue"

