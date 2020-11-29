sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/emby/xUbuntu_17.04/ /' > /etc/apt/sources.list.d/emby-server.list"
sudo apt-get update
sudo apt-get install emby-server
wget -nv https://download.opensuse.org/repositories/home:emby/xUbuntu_17.04/Release.key -O Release.key
sudo apt-key add - < Release.key
sudo apt-get update
