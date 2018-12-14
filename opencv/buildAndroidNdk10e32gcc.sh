export ANDROID_NDK=/home/az/sdk/android/ndk-r10e
export ANDROID_SDK=/home/az/sdk/android/sdk
#cd ..
#mkdir build

cd build
mkdir AndroidArm32r10eClang

export OPENCL_SDK=/home/az/sdk/opencl
export OPENCV_ANDROID_SDK=/home/az/sdk/src/opencv/build/AndroidArm32r10eClang
cd $OPENCV_ANDROID_SDK

# Now configure and compile opencv
cmake -Wno-dev \
-D CMAKE_TOOLCHAIN_FILE=../../opencv/platforms/android/android.toolchain.cmake \
-D ANDROID_TOOLCHAIN_NAME="arm-linux-androideabi-4.9" \
-D ANDROID_ABI="armeabi-v7a with NEON" \
-D ANDROID_STL="gnustl_shared" \
-D CMAKE_BUILD_WITH_INSTALL_RPATH=ON \
-D BUILD_ANDROID_EXAMPLES=OFF \
-D INSTALL_ANDROID_EXAMPLES=OFF \
-D WITH_OPENCL=YES \
-D ANDROID_OPENCL_SDK=$OPENCL_SDK \
-D ANDROID_NATIVE_API_LEVEL=21 \
-D ANDROID_SDK_TARGET=24 \
-D BUILD_ANDROID_PROJECTS=OFF \
-BUILD_FAT_JAVA_LIB=OFF \
-D BUILD_SHARED_LIBS=ON \
-D BUILD_TESTS=OFF \
-D BUILD_PERF_TESTS=OFF \
-D WITH_TIFF=OFF \
-D WITH_OPENEXR=OFF \
-D WITH_WEBP=OFF \
-D WITH_JASPER=OFF \
-D WITH_IMGCODEC_HDR=OFF \
-D WITH_IMGCODEC_SUNRASTER=OFF \
-D WITH_IMGCODEC_PXM=OFF \
-D WITH_IMGCODEC_PFM=OFF \
-D WITH_PROTOBUF=OFF \
-D WITH_CAROTENE=ON \
../../opencv

#time make -j4

#
#-D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules \

