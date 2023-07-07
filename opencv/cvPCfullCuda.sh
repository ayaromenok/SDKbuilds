#!/bin/sh
echo ">>>> Setup OpenCV on PC with OpenCL\CUDA"
# only basic setup from tegra used - POCL not necessary on PC
#../hardware/sysTegraX1.sh
#get vulkan SDK
sudo apt install lunarg-vktrace lunarg-vkconfig lunarg-vulkan-layers libgtk2.0-dev libgtk-3-dev pkg-config -y
#ffmpeg
sudo apt install libavcodec-dev libavdevice-dev libavfilter-dev libavformat-dev libavresample-dev libavutil-dev -y
echo ">>>> Get OpenCV"
mkdir ~/sdk
cd ~/sdk
mkdir src
cd src
mkdir opencv
cd opencv
#git clone https://github.com/opencv/opencv.git
#git clone https://github.com/opencv/opencv_contrib.git
#git clone https://github.com/opencv/opencv_extra.git


cd ../..
mkdir build
cd build
mkdir opencv_cuda
cd opencv_cuda

echo ">>>> Configure OpenCV"
cmake -D CMAKE_BUILD_TYPE=RELEASE \
	-D CMAKE_INSTALL_PREFIX=/usr/local \
	-D BUILD_PERF_TESTS=ON \
	-D BUILD_TESTS=OFF \
	-D BUILD_EXAMPLES=ON \
	-D BUIL_opencv_apps=ON \
	-D INSTALL_C_EXAMPLES=ON \
	-D INSTALL_PYTHON_EXAMPLES=ON \
	-D OPENCV_GENERATE_PKGCONFIG=YES \
	-D BUILD_opencv_python3=ON \
	-D WITH_OPENCL=ON \
	-D WITH_QT=ON \
	-D WITH_GTK_2_X=ON \
	-D WITH_OPENGL=ON \
	-D WITH_CUDA=ON \
	-D OPENCV_DNN_CUDA=ON \
	-D CUDA_ARCH_BIN=6.1 \
	-D CUDA_ARCH_PTX=6.1 \
	-D CUDA_FAST_MATH=ON \
	-D WITH_CUFFT=ON \
	-D WITH_CUBLAS=ON \
	-D WITH_CUDNN=ON \
	-D WITH_VULKAN=ON \
	-D WITH_CABLAS=ON \
	-D OPENCV_ENABLE_NONFREE=ON \
	-D OPENCV_EXTRA_MODULES_PATH=../../src/opencv/opencv_contrib/modules \
	-D BUILD_opencv_cvv=OFF \
	-D BUILD_opencv_rgbd=OFF \
	../../src/opencv/opencv

#	-D CUDA_ARCH_BIN=3.5,6.1 \
#	-D CUDA_ARCH_PTX=3.5,6.1 \

#	-D BUILD_TESTS=ON \	
echo ">>>> It's time for: make & make install & ldconfig"	
#make -j 4
#sudo make -j 4 install
#
#
