#!/bin/sh
echo "rpicamsrc present in gStreamer 1.18+, but necessary to compile in 1.14/Buster, actual in 2011"
sudo install autoconf automake libtool pkg-config libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libraspberrypi-dev libgstreamer1.0-tools
mkdir ~/sdk/src -p
cd ~/sdk/src
git clone https://github.com/thaytan/gst-rpicamsrc.git
cd gst-rpicamsrc
./autogen.sh --prefix=/usr --libdir=/usr/lib/arm-linux-gnueabihf/
make -j 4
sudo make install
sudo ldconfig

#gst-launch-1.0 rpicamsrc bitrate=1000000 ! filesink location=test.h264
#gst-inspect-1.0 rpicamsrc
