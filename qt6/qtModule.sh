QT6_VER=`cat _version.txt`
SRC_DIR=~/sdk/src/qt
MODULE_CUR=""
BUILD_DIR=~/sdk/build/$MODULE_CUR

PS3="Select module: "
select module in qt3d qt5compat qtserialport
do
    echo "Selected module: $module"
    MODULE_CUR=$module
    case $module in
	qt3d)
	    echo "qt3d"
	    break
	    ;;
	qt5compat)
	    echo "qt5 compat"
	    break
	    ;;
	qtserialport)
	    echo "qt serial port"
	    break
	    ;;
	*)
	    echo "unsupported option $PEPLY"
	    ;;
    esac
done
echo "Install Qt6 ${MODULE_CUR} ${QT6_VER}, src in ${SRC_PATH}, build in ${BUILD_PATH}"
#sudo apt-get build-dep qt5-default qtdeclarative5-dev -y
#sudo apt-get install build-essential git libxcb-xinerama0-dev libasound2-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libvulkan-dev '^libxcb.*-dev' libx11-xcb-dev libglu1-mesa-dev libxrender-dev libxi-dev cmake libxkbcommon-dev libxkbcommon-x11-dev -y


echo ">>>> get Qt6 ${MODULE_CUR}  - ${QT6_VER}"
mkdir "${SRC_DIR}" -p
cd ${SRC_DIR}

QT6_SRC_DIR=${MODULE_CUR}-everywhere-src-${QT6_VER}

if test -d "$QT6_SRC_DIR"; then
    echo "$QT6_SRC_DIR already exists."
else
    echo "$QT6_SRC_DIR does not exists."
    wget http://download.qt.io/official_releases/qt/6.2/${QT6_VER}/submodules/${MODULE_CUR}-everywhere-src-${QT6_VER}.tar.xz
    echo "Extracting ${MODULE_CUR}${QT6_VER}"
    tar xf ${MODULE_CUR}-everywhere-src-${QT6_VER}.tar.xz
    rm  ${MODULE_CUR}-everywhere-src-${QT6_VER}.tar.xz
    echo "Done"
fi

echo "Src dir: $QT6_SRC_DIR"
QT6_BUILD_DIR=${BUILD_DIR}${QT6_VER}
if test -d "$QT6_BUILD_DIR"; then
    echo "$QT6_BUILD_DIR already exists. Remove it to rebuild from scratch."
else
    echo "$QT6_BUILD_DIR does not exists."
    mkdir "${QT6_BUILD_DIR}"
    cd  "${QT6_BUILD_DIR}"
    cmake  \
	    -DCMAKE_INSTALL_PREFIX=/usr/local/qt6 \
	    ${SRC_DIR}/${QT6_SRC_DIR}
    make -j 4
    sudo make install
fi


