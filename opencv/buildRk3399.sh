cd ~/sdk/src
git clone https://github.com/ayaromenok/opencv.git
mkdir build
cd build
mkdir opencv
cd opencv
cmake -D CMAKE_BUILD_TYPE=RELEASE \
	-D CMAKE_INSTALL_PREFIX=/usr/local \
	-D BUILD_TESTS=OFF \
	-D BUILD_EXAMPLES=OFF \
	-D INSTALL_C_EXAMPLES=OFF \
	-D WITH_OPENCL=ON \
	../../opencv
make -j 2
sudo make -j 6 install
#	-D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules \
