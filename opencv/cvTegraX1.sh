#!/bin/sh
echo ">>>> Setup OpenCV on TegraX1"

../hardware/sysTegraX1.sh
../hardware/sysTegraX1Pocl.sh

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
	-D INSTALL_C_EXAMPLES=ON \
	-D WITH_OPENCL=ON \
	-D ENABLE_NEON=ON \
	-D WITH_QT=ON \
	-D WITH_OPENGL=OFF \
	-D WITH_CUDA=ON \
	-D WITH_CUDNN=ON \
	-D CUDA_FAST_MATH=ON \
	-D WITH_CABLAS=ON \
	-D OPENCV_ENABLE_NONFREE=ON \
	-D OPENVC_GENERATE_PKGCONFIG=ON \
	-D OPENCV_EXTRA_MODULES_PATH=../../src/opencv/opencv_contrib/modules \
	../../src/opencv/opencv
	
echo ">>>> It's time for: make & make install & ldconfig"	
make -j 4
sudo make -j 4 install
#
#
