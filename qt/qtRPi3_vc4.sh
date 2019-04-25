echo ">>>> Setup Qt5 base"

#../hardware/sysRPi3.sh

sudo apt-get build-dep qtbase-opensource-src
sudo apt-get install '^libxcb.*-dev' libx11-xcb-dev libglu1-mesa-dev libxrender-dev libxi-dev
#for multimedia, probably plugins-bad required - need to test
#sudo apt-get install libasound2-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev


echo ">>>> get Qt5 base"
mkdir ~/sdk
cd ~/sdk
mkdir src
cd src
mkdir qt
cd qt

#wget http://download.qt.io/official_releases/qt/5.12/5.12.3/submodules/qtbase-everywhere-src-5.12.3.tar.xz
#tar xf qtbase-everywhere-src-5.12.3.tar.xz

cd ../..
mkdir build
cd build
mkdir qt
cd qt

echo ">>>> Configure Qt5 base"
PKG_CONFIG_LIBDIR=/usr/lib/arm-linux-gnueabihf/pkgconfig:/usr/share/pkgconfig \
../../src/qt/qtbase-everywhere-src-5.12.3/configure \
-opengl desktop \
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
-prefix /usr/local 

QMAKE_CFLAGS="-march=armv8-a -mtune=cortex-a53 -mfpu=crypto-neon-fp-armv8" \
QMAKE_CXXFLAGS="-march=armv8-a -mtune=cortex-a53 -mfpu=crypto-neon-fp-armv8" \


echo ">>>> RPi X11 status:"
less config.summary | grep "Desktop OpenGL"
less config.summary | grep "XCB Xlib"
less config.summary | grep "EGL on X11"
	
echo " "
echo "It's time for: make & make install & ldconfig"	

