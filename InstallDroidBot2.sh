#!/bin/bash
sudo apt-get install openjdk-8-jre #Installs openJDK 8 which the bot is based off of
cd ~
mkdir DroidBot2 #Makes Directory for Bot
cd DroidBot2 
wget https://maxdistructo.github.io/droidbot2/downloads/latest/stable/droidbot2.jar #Downloads latest version of bot from website.
mkdir droidbot
cd droidbot
wget https://raw.githubusercontent.com/MaxDistructo/droidbot2/master/droidbot2/config/config.txt #Downloads Example Config File
x-terminal-emulator -e /usr/bin/nano ~/DroidBot2/droidbot2/config/config.txt
read -n "Please change the config values with your token and press any key to continue"
cd ~/DroidBot2
cd config
mkdir casino
mkdir emotes
mkdir blackjack
java -jar droidbot2.jar
