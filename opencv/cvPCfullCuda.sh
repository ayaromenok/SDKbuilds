#!/bin/sh
echo ">>>> Setup OpenCV on PC with OpenCL\CUDA"
# only basic setup from tegra used - POCL not necessary on PC
#../hardware/sysTegraX1.sh
#get vulkan SDK
sudo apt install lunarg-vktrace lunarg-vkconfig lunarg-vulkan-layers -y

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
mkdir opencv_cuda
cd opencv_cuda

echo ">>>> Configure OpenCV"
cmake -D CMAKE_BUILD_TYPE=RELEASE \
	-D CMAKE_INSTALL_PREFIX=/usr/local \
	-D BUILD_PERF_TESTS=ON \
	-D BUILD_EXAMPLES=ON \
	-D BUILD_TESTS=OFF \
	-D INSTALL_C_EXAMPLES=ON \
	-D OPENCV_GENERATE_PKGCONFIG=YES \
	-D WITH_OPENCL=ON \
	-D WITH_QT=ON \
	-D WITH_OPENGL=ON \
	-D WITH_CUDA=ON \
	-D WITH_CUFFT=ON \
	-D WITH_CUBLAS=ON \
	-D WITH_CUDNN=ON \
	-D WITH_VULKAN=ON \
	-D CUDA_FAST_MATH=ON \
	-D WITH_CABLAS=ON \
	-D OPENCV_ENABLE_NONFREE=ON \
	-D OPENCV_EXTRA_MODULES_PATH=../../src/opencv/opencv_contrib/modules \
	-D BUILD_opencv_cvv=OFF \
	-D BUILD_opencv_rgbd=OFF \
	../../src/opencv/opencv

#	-D BUILD_TESTS=ON \	
echo ">>>> It's time for: make & make install & ldconfig"	
#make -j 4
#sudo make -j 4 install
#
#
