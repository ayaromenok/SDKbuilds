QTC_VER=`cat _qtcreator_version.txt`
QTC_VER_MAJOR=${QTC_VER::-8}
QT6_VER=`cat _version.txt`
QT6_VER_MAJOR=${QT6_VER::-2}

SRC_DIR=~/sdk/src/qt
BUILD_DIR=~/sdk/build/qtcreator${QTC_VER_MAJOR}
sudo apt install ninja-build -y
#echo "Install QtCreator ${QTC_VER}, src in ${SRC_PATH}, build in ${BUILD_PATH}"
#sudo apt-get build-dep qt5-default qtdeclarative5-dev -y
#sudo apt-get install build-essential git libxcb-xinerama0-dev libasound2-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libvulkan-dev '^libxcb.*-dev' libx11-xcb-dev libglu1-mesa-dev libxrender-dev libxi-dev libxkbcommon-dev libxkbcommon-x11-dev -y
#sudo apt-get install  libxcb-xinput-dev libxi-dev libx11-xcb-dev
#sudo apt install libmd4c-dev libdouble-conversion-dev
#sudo ln -s /usr/lib/x86_64-linux-gnu/libmd4c.so.0.4.8 /usr/lib/x86_64-linux-gnu/libmd4c-html.so.0.4.8
#sudo apt-get install libxkbcommon-x11-dev
#sudo apt-get install cmake

echo ">>>> get QtCreator - ${QTC_VER}"
mkdir "${SRC_DIR}" -p
#mkdir "${BUILD_DIR}" -p
cd ${SRC_DIR}

QTC_SRC_DIR=qt-creator-opensource-src-${QTC_VER}
if test -d "$QTC_SRC_DIR"; then
    echo "$QTC_SRC_DIR already exists."
else
    echo "$QTC_SRC_DIR does not exists."
    mkdir -p ${QTC_SRC_DIR}
    wget http://download.qt.io/development_releases/qtcreator/${QTC_VER_MAJOR}/${QTC_VER}/${QTC_SRC_DIR}.tar.xz
    echo "Extracting QtCreator-${QTC_VER}"
    tar xf ${QTC_SRC_DIR}.tar.xz
    rm  ${QTC_SRC_DIR}.tar.xz
    echo "Done"
fi


QTC_BUILD_DIR=${BUILD_DIR}

if test -d "$QTC_BUILD_DIR"; then
    echo "$QTC_BUILD_DIR already exists. Remove it to rebuild from scratch."
else
    echo "$QTC_BUILD_DIR does not exists."
    mkdir -p "${QTC_BUILD_DIR}"
    cd  "${QTC_BUILD_DIR}"
    cmake -DCMAKE_BUILD_TYPE=Debug -G Ninja\
          -DCMAKE_PREFIX_PATH=/usr/local/qt${QT6_VER_MAJOR}\
          -DCMAKE_INSTALL_PREFIX=/usr/local\
          ${SRC_DIR}/${QTC_SRC_DIR}
    cmake --build .
    #make -j 4
    sudo make install
fi

#cmake -DCMAKE_INSTALL_PREFIX=/usr/local/qt63 ~/sdk/src/qt/qtbase-everywhere-src-6.3.1/ -GNinja -DFEATURE_system_xcb_xinput=O
