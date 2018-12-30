#default system from friendlyarm required installation of cmake
#sudo apt install cmake
mkdir ~/sdk
cd ~/sdk
mkdir src
cd ~/sdk/src
git clone https://github.com/ayaromenok/opencv.git
mkdir build
cd build
mkdir opencv
cd opencv
git checkout OpenCL_OutOfRes_ArmMali
cmake -D CMAKE_BUILD_TYPE=RELEASE \
	-D CMAKE_INSTALL_PREFIX=/usr/local \
	-D BUILD_TESTS=ON \
	-D BUILD_EXAMPLES=OFF \
	-D INSTALL_C_EXAMPLES=OFF \
	-D WITH_OPENCL=ON \
	../../opencv
make -j 6
sudo make -j 6 install
#	-D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules \

#for opencv_perf_
#git clone https://github.com/opencv/opencv_extra.git
