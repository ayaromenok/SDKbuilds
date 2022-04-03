echo ">>>> Setup Qt5 all"

#../hardware/sysRPi3.sh

#sudo apt-get build-dep qtbase-opensource-src qt-opensource-src
#sudo apt-get install '^libxcb.*-dev' libx11-xcb-dev libglu1-mesa-dev libxrender-dev libxi-dev libgles2-mesa-dev libegl1-mesa-dev
#for multimedia, probably plugins-bad required - need to test
#sudo apt-get install libasound2-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev


echo ">>>> get Qt5 all"
mkdir ~/sdk
cd ~/sdk
mkdir src
cd src
mkdir qt
cd qt

#wget http://download.qt.io/official_releases/qt/5.15/5.15.1/single/qt-everywhere-src-5.15.1.tar.xz
#tar xf qt-everywhere-src-5.15.1.tar.xz

cd ../..
mkdir build
cd build
mkdir qt_vc4
cd qt_vc4

echo ">>>> Configure Qt5 all"
PKG_CONFIG_LIBDIR=/usr/lib/arm-linux-gnueabihf/pkgconfig:/usr/share/pkgconfig \
../../src/qt/qt-everywhere-src-5.15.1/configure \
-opengl es2 \
-no-gtk \
-opensource -confirm-license -release \
-reduce-exports \
-force-pkg-config \
-nomake examples -no-compile-examples \
-qt-pcre \
-no-pch \
-ssl \
-evdev \
-system-freetype \
-fontconfig \
-glib \
-skip qtlocation \
-skip qtwayland \
-skip qtwebengine \
-skip qtwebchannel \
-skip qtwebglplugin \
-skip qtwebsockets \
-skip qtwebview \
-skip qtcanvas3d \
-skip qtdatavis3d \
-skip qtvirtualkeyboard \
-skip qtscript \
-skip qtcharts \
-skip qtscxml \
-skip qttools \
-skip qtxmlpatterns \
-skip qtquick3d \
-skip qtserialport \
-skip qtserialbus \
-prefix /usr/local

QMAKE_CFLAGS="-march=armv8-a -mtune=cortex-a53 -mfpu=crypto-neon-fp-armv8" \
QMAKE_CXXFLAGS="-march=armv8-a -mtune=cortex-a53 -mfpu=crypto-neon-fp-armv8" \


echo ">>>> RPi X11 status:"
less config.summary | grep "Desktop OpenGL"
less config.summary | grep "OpenGL ES"
less config.summary | grep "XCB Xlib"
less config.summary | grep "EGL on X11"
	
echo " "
echo "It's time for: make & make install & ldconfig"	

