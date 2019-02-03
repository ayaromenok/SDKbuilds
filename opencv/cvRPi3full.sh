#!/bin/sh
echo ">>>> Setup OpenCV on RPi3"
../hardware/rpi3.sh

echo ">>>> Get OpenCV"
mkdir ~/sdk
cd ~/sdk
mkdir src
cd src
mkdir opencv
cd opencv
git clone https://github.com/opencv/opencv.git
git clone https://github.com/opencv/opencv_contrib.git
#git clone https://github.com/opencv/opencv_extra.git

cd ..
mkdir build
cd build
mkdir opencv
cd opencv

echo ">>>> Configure OpenCV"
cmake -D CMAKE_BUILD_TYPE=RELEASE \
	-D CMAKE_INSTALL_PREFIX=/usr/local \
	-D BUILD_TESTS=OFF \
	-D BUILD_EXAMPLES=ON \
	-D INSTALL_C_EXAMPLES=ON \
	-D WITH_OPENCL=OFF \
	-D ENABLE_NEON=ON \
	-D ENABLE_VFPV3=ON \
	-D OPENCV_EXTRA_MODULES_PATH=../../opencv/opencv_contrib/modules \
	../../opencv/opencv
	
echo ">>>> It's time for: make & make install & ldconfig"	
#make
#sudo make -j 1 install
#
#
