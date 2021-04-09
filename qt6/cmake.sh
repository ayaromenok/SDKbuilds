#!/bin/sh
sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates gnupg software-properties-common wget -y
wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | gpg --dearmor - | sudo tee /etc/apt/trusted.gpg.d/kitware.gpg >/dev/null
sudo apt-add-repository 'deb https://apt.kitware.com/ubuntu/ bionic main'
sudo apt-get update
sudo apt install cmake -y
