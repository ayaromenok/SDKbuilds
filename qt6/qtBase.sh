QT6_VER=`cat _version.txt`
QT6_VER_MAJOR=${QT6_VER::-2}
SRC_DIR=~/sdk/src/qt
BUILD_DIR=~/sdk/build/qt${QT6_VER_MAJOR}/base

echo "Install Qt ${QT6_VER}, src in ${SRC_PATH}, build in ${BUILD_PATH}"
sudo apt-get build-dep qt5-default qtdeclarative5-dev -y
sudo apt-get install build-essential git libxcb-xinerama0-dev libasound2-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libvulkan-dev '^libxcb.*-dev' libx11-xcb-dev libglu1-mesa-dev libxrender-dev libxi-dev libxkbcommon-dev libxkbcommon-x11-dev -y
sudo apt-get install  libxcb-xinput-dev libxi-dev libx11-xcb-dev -y
sudo apt install libmd4c-dev libdouble-conversion-dev -y
sudo ln -s /usr/lib/x86_64-linux-gnu/libmd4c.so.0.4.8 /usr/lib/x86_64-linux-gnu/libmd4c-html.so.0.4.8
sudo apt-get install libxkbcommon-x11-dev cmake -y
#sudo apt-get install cmake

echo ">>>> get Qt6 Base - ${QT6_VER}"
mkdir "${SRC_DIR}" -p
#mkdir "${BUILD_DIR}" -p
cd ${SRC_DIR}

QT6_SRC_DIR=qtbase-everywhere-src-${QT6_VER}
if test -d "$QT6_SRC_DIR"; then
    echo "$QT6_SRC_DIR already exists."
else
    echo "$QT6_SRC_DIR does not exists."
    mkdir -p ${QT6_SRC_DIR}
    wget http://download.qt.io/official_releases/qt/${QT6_VER_MAJOR}/${QT6_VER}/submodules/qtbase-everywhere-src-${QT6_VER}.tar.xz
    echo "Extracting Qt-${QT6_VER}"
    tar xf qtbase-everywhere-src-${QT6_VER}.tar.xz
    rm  qtbase-everywhere-src-${QT6_VER}.tar.xz
    echo "Done"
fi


QT6_BUILD_DIR=${BUILD_DIR}
if test -d "$QT6_BUILD_DIR"; then
    echo "$QT6_BUILD_DIR already exists. Remove it to rebuild from scratch."
else
    echo "$QT6_BUILD_DIR does not exists."
    mkdir -p "${QT6_BUILD_DIR}"
    cd  "${QT6_BUILD_DIR}"
    cmake  \
            -DCMAKE_INSTALL_PREFIX=/usr/local/qt${QT6_VER_MAJOR} \
            ${SRC_DIR}/${QT6_SRC_DIR}
    make -j$(nproc)
    sudo make install
fi

echo "/usr/local/qt${QT6_VER_MAJOR}/lib" | sudo tee /etc/ld.so.conf.d/qt${QT6_VER_MAJOR}.conf
sudo ldconfig


