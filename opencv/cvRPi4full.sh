#!/bin/sh
echo ">>>> Setup OpenCV on RPi4"
../hardware/rpi3.sh
echo ">>>> Build POCL for Arm-A72"
../hardware/sysRPi4Pocl.sh

echo ">>>> Get OpenCV latest"
mkdir ~/sdk
cd ~/sdk
mkdir src
cd src
mkdir opencv
cd opencv
git clone https://github.com/opencv/opencv.git
git clone https://github.com/opencv/opencv_contrib.git
git clone https://github.com/opencv/opencv_extra.git

cd ../..
mkdir build
cd build
mkdir opencv
cd opencv

echo ">>>> Configure OpenCV"
cmake -D CMAKE_BUILD_TYPE=RELEASE \
	-D CMAKE_INSTALL_PREFIX=/usr/local \
	-D BUILD_TESTS=ON \
	-D BUILD_PERF_TESTS=ON \
	-D BUILD_EXAMPLES=ON \
	-D INSTALL_C_EXAMPLES=ON \
	-D WITH_OPENCL=ON \
	-D ENABLE_NEON=ON \
	-D ENABLE_VFPV3=ON \
	-D WITH_QT=ON \
	-D WITH_OPENGL=OFF\
	-D OPENCV_EXTRA_MODULES_PATH=../../src/opencv/opencv_contrib/modules \
	../../src/opencv/opencv
	
echo ">>>> It's time for: make & make install & ldconfig"	
make -j 4
sudo make -j 4 install
sudo ldconfig
#
#
