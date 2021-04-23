#!/bin/sh
sudo apt update
sudo apt install build-essential yasm cmake libtool libc6 libc6-dev unzip wget libnuma1 libnuma-dev -y

mkdir ~/sdk/src/ffmpeg
cd ~/sdk/src/ffmpeg

git clone https://git.videolan.org/git/ffmpeg/nv-codec-headers.git
git clone https://git.ffmpeg.org/ffmpeg.git

cd nv-codec-headers && sudo make install && cd - 
mkdir ~/sdk/build/ffmpeg
cd ~/sdk/build/ffmpeg

../../src/ffmpeg/ffmpeg/configure --enable-nonfree --enable-libnpp --extra-cflags=-I/usr/local/cuda/include --extra-ldflags=-L/usr/local/cuda/lib64

make -j 

sudo make install
