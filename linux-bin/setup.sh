#!/bin/bash
#sudo apt install git
mkdir -p ~/git
cd ~/git
git clone git@github.com:MaxDistructo/ShellScripts.git
cd ShellScripts
ln -s linux-bin ~/bin
echo "path+=$HOME/bin" >> ~/.zshrc
echo "export PATH" ~/.zshrc