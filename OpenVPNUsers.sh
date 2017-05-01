#!bin/bash
sudo -s
read -p "Input the number of users you would like to create. They will be named Client# for each one." "users"
read -p "Input the password for your Clients to use." "password"
for i  in {1..$users}
do
#Untested because you need to enter pass phrase twice and IDK on the second input what it prompts you for
cd /etc/openvpn/easy-rsa
spawn ./build-key-pass Client$i
expect Enter PEM pass phrase: 
send "$password"
expect Verifying - Enter PEM pass phrase: #Work in progress
send "$password"
expect A challenge password?:
send ""
expect Sign the certificate? [y/n]:
send "y"
cd keys
spawn openssl rsa -in Client$i.key -des3 -out Client$i.3des.key
expect Enter pass phrase for Client$i.key: 
send "$password"
expect Enter PEM pass phrase:
send "$password"
expect Verifying - Enter PEM pass phrase:
send "$password"
cd ..
./build-dh
openvpn --genkey --secret keys/ta.key
cd /etc/openvpn/
wget https://raw.githubusercontent.com/MaxDistructo/ShellScripts/master/conf/server.conf
