#!/bin/bash
sudo apt-get install build-essential libncursesw5-dev libgdbm-dev libc6-dev
sudo apt-get install zlib1g-dev libsqlite3-dev tk-dev
sudo apt-get install libssl-dev openssl
sudo apt-get install build-essential unzip -y
sudo apt-get install software-properties-common -y
sudo add-apt-repository ppa:fkrull/deadsnakes -y
sudo add-apt-repository ppa:mc3man/trusty-media -y
sudo add-apt-repository ppa:chris-lea/libsodium -y
sudo apt-get install libopus-dev libffi-dev libsodium-dev
cd /usr/src
sudo git clone git://git.videolan.org/x264
cd x264
sudo ./configure --host=arm-unknown-linux-gnueabi --enable-static --disable-opencl
sudo make
sudo make install
cd /usr/src
sudo git clone https://github.com/FFmpeg/FFmpeg.git
cd FFmpeg
sudo ./configure --arch=armel --target-os=linux --enable-gpl --enable-libx264 --enable-nonfree
sudo make -j4
sudo make install
cd ~
git clone https://github.com/Just-Some-Bots/MusicBot.git MusicBot -b master
cd MusicBot
sudo -H pip3.6 install --upgrade -r requirements.txt
cd config
echo "All of the following Require Debug IDs. Tutorial on how to get these is found here 'http://i.imgur.com/GhKpBMQ.gif'"
read -p "What is your bot_token?" "bottoken"
read -p "What is your Owner ID?" "ownerid"
read -p "What would you like for your command prefix?" "prefix"
echo -e [Credentials]/nToken = $bottoken/n[Permissions]/nOwnerID = $ownerid/n[Chat]/nCommandPrefix = $prefix/n[MusicBot]/nDefaultVolume = 0.15/nWhiteListCheck = no/nSkipsRequired = 4/nSkipRatio = 0.5/nSaveVideos = yes/nNowPlayingMentions = no/nAutoSummon = yes/nUseAutoPlaylist = yes/nAutoPause = yes/nDeleteMessages = yes/nDeleteInvoking = no/nDebugMode = no >> options.ini
read -p "What role has full permissions on your server? (Can edit everything, EX:Administrators)" "admin"
read -p "What role has almost all permissions on your server? (EX:Staff)" "staff"
echo -e [Default]/nCommandWhitelist = play queue np skip search id help/n; CommandBlacklist =/nIgnoreNonVoice = play skip search/n; GrantToRoles =/n; UserList =/nMaxSongLength = 500/nMaxSongs = 3/nAllowPlaylists = no/n; MaxPlaylistLength = 20/nInstaSkip = no/n[Administrators]/nGrantToRoles = $admin/n; UserList =/nMaxSongLength = 0/nMaxSongs = 0/nMaxPlaylistLength = 0/nAllowPlaylists = yes/nInstaSkip = yes/n[DJ]/nCommandBlacklist = blacklist listids/nGrantToRoles = $staff/n; UserList =/nMaxSongLength = 0/nMaxSongs = 0/nMaxPlaylistLength = 0/nAllowPlaylists = yes/nInstaSkip = yes >> permissions.ini
python3.6 run.py
