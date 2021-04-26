#!/bin/sh
echo ">>>> Setup OpenCV on RPi3"
../hardware/sysRPi3.sh
sudo mv /usr/bin/python /usr/bin/_python
sudo mv /usr/bin/python3 /usr/bin/_python3

echo ">>>> Get OpenCV"
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
	-D BUILD_JAVA=OFF \
	-D BUILD_PYTHON=OFF \
	-D INSTALL_C_EXAMPLES=ON \
	-D WITH_OPENCL=OFF \
	-D ENABLE_NEON=ON \
	-D WITH_GSTREAMER=ON \
	-D ENABLE_VFPV3=ON \
	-D WITH_QT=ON \
	-D WITH_OPENGL=OFF\
	-D OPENCV_EXTRA_MODULES_PATH=../../src/opencv/opencv_contrib/modules \
	../../src/opencv/opencv
	
echo ">>>> It's time for: make & make install & ldconfig"	
make -j 2
sudo make -j 4 install
sudo mv /usr/bin/_python /usr/bin/python
sudo mv /usr/bin/_python3 /usr/bin/python3

#
#
