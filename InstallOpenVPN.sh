#!/bin/bash
sudo -s
xterm -e 'sudo passwd' & read -n 1 -p "Press Enter to continue once you have set a new username and password" passwdchanged
sudo apt-get update
sudo apt-get install expect -Y
sudo apt-get install openvpn -Y
cp -r /usr/share/doc/openvpn/examples/easy-rsa/2.0 /etc/openvpn/easy-rsa
cd /etc/openvpn/easy-rsa
xterm -e 'nano vars' & read -n 1 -p "Press Enter when you have inputed the value as shown here: http://15809-presscdn-0-93.pagely.netdna-cdn.com/wp-content/uploads/2016/02/MTIyMzAyMDUwNDQzODgxNzUz.png"
cd /etc/openvpn/easy-rsa
source ./vars
./clean-all
spawn ./build-ca
expect Country Name (2 letter code) [US]:
send "."
expect State or Province Name (full name) [CA]:
send "."
expect Locality Name (eg, city) [SanFrancisco]:
send "."
expect Organization Name (eg, company) [Fort-Funsion]:
send "."
expect Organizational Unit Name (eg, section) [changeme]:
send "."
expect Common Name (eg, your name or your servers hostname) [changeme]:
send "."
expect Name [changeme]:
send "."
expect Email Address [mail@host.domain]:
send "."
read -p "Input a Name for your Server" "servername"
spawn ./build-key-server "$servername"
expect Commmon Name:
send "$servername"
expect A challenge password?:
send ""
expect 1 out of 1 certificate requests certified, commit? [y/n]:
send "y"
echo "Time to create clients for your devices!"
cd ~
mkdir tmp
cd tmp
wget https://raw.githubusercontent.com/MaxDistructo/ShellScripts/master/OpenVPNUsers.sh

