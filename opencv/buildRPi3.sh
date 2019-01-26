#!/bin/sh
echo "setup OpenCV on RPi3"
sudo apt-get install build-essential cmake unzip pkg-config libjpeg-dev libpng-dev libtiff-dev libavcodec-dev libavformat-dev libswscale-dev libv4l-dev libx264-dev
mkdir ~/sdk
cd ~/sdk
mkdir src
cd ~/sdk/src
git clone https://github.com/ayaromenok/opencv.git
#git clone https://github.com/opencv/opencv_extra.git &
mkdir build
cd build
mkdir opencv
cd opencv
cmake -D CMAKE_BUILD_TYPE=RELEASE \
	-D CMAKE_INSTALL_PREFIX=/usr/local \
	-D BUILD_TESTS=OFF \
	-D BUILD_EXAMPLES=OFF \
	-D INSTALL_C_EXAMPLES=OFF \
	-D WITH_OPENCL=OFF \
	-D ENABLE_NEON=ON \
	-D ENABLE_VFPV3=ON \
	../../opencv
make
sudo make -j 1 install
#	-D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules \
#
