#!/bin/bash

base=$(cd $(dirname $0); pwd)

sudo apt-get -y update
sudo apt-get -y install zsh vim git gh

echo "- Change shell"
sudo chsh -s /usr/bin/zsh

echo "- Ctrl/Caps"
/usr/bin/setxkbmap -option "ctrl:nocaps"
