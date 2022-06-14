QT6_VER=`cat _version_dev.txt`
#QT6_VER_MAJOR=${QT6_VER::-2}
SRC_DIR=~/sdk/src/qt
BUILD_DIR=~/sdk/build/qtBaseDev

echo "Install Qt ${QT6_VER}, src in ${SRC_PATH}, build in ${BUILD_PATH}"
sudo apt-get build-dep qt5-default qtdeclarative5-dev -y
sudo apt-get install build-essential git libxcb-xinerama0-dev libasound2-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libvulkan-dev '^libxcb.*-dev' libx11-xcb-dev libglu1-mesa-dev libxrender-dev libxi-dev cmake libxkbcommon-dev libxkbcommon-x11-dev -y


echo ">>>> get Qt6 Base - ${QT6_VER}"
mkdir "${SRC_DIR}" -p
cd ${SRC_DIR}

QT6_SRC_DIR=qtbase
if test -d "$QT6_SRC_DIR"; then
    echo "$QT6_SRC_DIR already exists."
else
    echo "$QT6_SRC_DIR does not exists."
    mkdir -p ${QT6_SRC_DIR}
    git clone git://code.qt.io/qt/qtbase.git
    cd qtbase
    git checkout ${QT6_VER}
    echo "Done"
fi


QT6_BUILD_DIR=${BUILD_DIR}${QT6_VER}
if test -d "$QT6_BUILD_DIR"; then
    echo "$QT6_BUILD_DIR already exists. Remove it to rebuild from scratch."
else
    echo "$QT6_BUILD_DIR does not exists."
    mkdir -p "${QT6_BUILD_DIR}"
    cd  "${QT6_BUILD_DIR}"
    cmake  \
	    -DCMAKE_INSTALL_PREFIX=/usr/local/qt${QT6_VER}dev \
	    ${SRC_DIR}/${QT6_SRC_DIR}
    make -j 4
    sudo make install
fi


