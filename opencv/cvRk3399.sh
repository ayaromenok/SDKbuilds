#default system from friendlyarm required installation of cmake
# gtk required if Qt not used. gstreamer - to use camera on Rk3999
#sudo apt install libgtk2.0-dev pkg-config gstreamer1.0-tools gstreamer1.0-plugins-good gstreamer1.0-plugins-base gstreamer1.0-plugins-base-apps libgstreamer-plugins-base1.0-dev libgstreamer-plugins-good1.0-dev libgstreamer1.0-dev
sudo apt install cmake
mkdir ~/sdk
cd ~/sdk
mkdir src
cd ~/sdk/src
git clone https://github.com/ayaromenok/opencv.git
git clone https://github.com/opencv/opencv_extra.git &
cd opencv
git checkout OpenCL_OutOfRes_ArmMali
cd ..
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

#for opencv_perf_
#
