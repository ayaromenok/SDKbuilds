QT6_VER=`cat _version_dev.txt`
SRC_DIR=~/sdk/src/qt
BUILD_DIR=~/sdk/build/qtEveryWhere

echo "Install Qt ${QT6_VER}, src in ${SRC_PATH}, build in ${BUILD_PATH}"
sudo apt-get build-dep qt5-default qtdeclarative5-dev -y
sudo apt-get install build-essential cmake git libxcb-xinerama0-dev libasound2-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libvulkan-dev '^libxcb.*-dev' libx11-xcb-dev libglu1-mesa-dev libxrender-dev libxi-dev cmake libxkbcommon-dev libxkbcommon-x11-dev -y


echo ">>>> get Qt6 EveryWhere - ${QT6_VER}"
mkdir "${SRC_DIR}" -p
cd ${SRC_DIR}

QT6_SRC_DIR=qt-everywhere-src-${QT6_VER}
if test -d "$QT6_SRC_DIR"; then
    echo "$QT6_SRC_DIR already exists."
else
    echo "$QT6_SRC_DIR does not exists. Creating..."
    wget http://download.qt.io/development_releases/qt/6.3/${QT6_VER}/single/qt-everywhere-src-${QT6_VER}.tar.xz
    echo "Extracting Qt-${QT6_VER}"
    tar xf qt-everywhere-src-${QT6_VER}.tar.xz
    rm  qt-everywhere-src-${QT6_VER}.tar.xz
    echo "Done"
fi

QT6_BUILD_DIR=${BUILD_DIR}-${QT6_VER}
if test -d "$QT6_BUILD_DIR"; then
    echo "$QT6_BUILD_DIR already exists. Remove it to rebuild from scratch."
else
    echo "$QT6_BUILD_DIR does not exists. Creating..."
    mkdir "${QT6_BUILD_DIR}"
    cd  "${QT6_BUILD_DIR}"
    cmake  \
	    -DCMAKE_INSTALL_PREFIX=/usr/local/qt6dev \
	    -DBUILD_qttranslation=OFF \
	    -DBUILD_qtwayland=OFF \
	    ${SRC_DIR}/${QT6_SRC_DIR}

#    cmake --build . --parallel
#    sudo cmake --install .
    make -j 4
    sudo make install
fi


