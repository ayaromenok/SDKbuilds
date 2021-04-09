CMAKE_VER=`cat _cmake_version.txt`
QT^_VER=`cat _version.txt`
SRC_DIR=~/sdk/src/cmake
BUILD_DIR=~/sdk/build/cmake

echo "Install CMake ${CMAKE_VER}, required by Qt ${QT6_VER}: src in ${SRC_PATH}, build in ${BUILD_PATH}"
sudo apt-get install build-essential cmake git -y


echo ">>>> get CMake - ${CMAKE_VER}"
mkdir "${SRC_DIR}" -p
mkdir "${BUILD_DIR}" -p
cd ${SRC_DIR}

CMAKE_SRC_DIR=cmake-${CMAKE_VER}
if test -d "$CMAKE_SRC_DIR"; then
    echo "$CMAKE_SRC_DIR already exists."
else
    echo "$CMAKE_SRC_DIR does not exists."
    wget https://github.com/Kitware/CMake/releases/download/v${CMAKE_VER}/cmake-${CMAKE_VER}.tar.gz
    echo "Extracting CMake-${CMAKE_VER}"
    tar xf cmake-${CMAKE_VER}.tar.gz
    rm  cmake-${CMAKE_VER}.tar.gz
    echo "Done"
fi


CMAKE_BUILD_DIR=${BUILD_DIR}-${CMAKE_VER}
if test -d "$CMAKE_BUILD_DIR"; then
    echo "$CMAKE_BUILD_DIR already exists. Remove it to rebuild from scratch."
else
    echo "$CMAKE_BUILD_DIR does not exists."
    mkdir "${CMAKE_BUILD_DIR}"
    cd  "${CMAKE_BUILD_DIR}"
    cmake  \
	    -DCMAKE_INSTALL_PREFIX=/usr/local \
	    ${SRC_DIR}/${CMAKE_SRC_DIR}
    make -j 4
    sudo make install
fi


