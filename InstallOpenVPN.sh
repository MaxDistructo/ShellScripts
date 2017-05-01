#!/bin/bash
sudo -s
xterm -e 'sudo passwd' & read -n 1 -p "Press Enter to continue once you have set a new username and password" passwdchanged
sudo apt-get update
sudo apt-get install openvpn -Y
cp -r /usr/share/doc/openvpn/examples/easy-rsa/2.0 /etc/openvpn/easy-rsa
cd /etc/openvpn/easy-rsa
xterm -e 'nano vars' & read -n 1 -p "Press Enter when you have inputed the value as shown here: http://15809-presscdn-0-93.pagely.netdna-cdn.com/wp-content/uploads/2016/02/MTIyMzAyMDUwNDQzODgxNzUz.png"
cd /etc/openvpn/easy-rsa
source ./vars
./clean-all
echo "Spam hit enter on the following commands. You do not need to enter a value unless you want to"
./build-ca
echo "Follow the instructions in the other window. This will create your certificate for a secure  network"
xterm -e 'echo "Please type the following commands in order. 1. cd /etc/openvpn/easy-rsa 2. ./build-key-server [Server_Name_Of_Your_Choice]"' & read -n 1 -p "Press Enter to finish Server Setup"
echo "Time to create clients for your devices!"
wget
