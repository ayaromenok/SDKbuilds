echo ">>>> Setup Qt5 base"

../hardware/sysRPi3.sh

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
-v \
-opengl es2 -eglfs \
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
-prefix /usr/local \
-qpa eglfs \

QMAKE_CFLAGS="-march=armv8-a -mtune=cortex-a53 -mfpu=crypto-neon-fp-armv8" \
QMAKE_CXXFLAGS="-march=armv8-a -mtune=cortex-a53 -mfpu=crypto-neon-fp-armv8" \

QMAKE_LIBDIR_OPENGL_ES2="/opt/vc/lib" \
QMAKE_INCDIR_OPENGL_ES2="/opt/vc/include /opt/vc/include/interface/vcos/pthreads /opt/vc/include/interface/vmcs_host/linux" \
QMAKE_LIBS_OPENGL_ES2="-lGLESv2"

QMAKE_INCDIR_EGL="/opt/vc/include /opt/vc/include/interface/vcos/pthreads /opt/vc/include/interface/vmcs_host/linux" \
QMAKE_LIBDIR_EGL="/opt/vc/lib" \
QMAKE_LIBS_EGL="-lEGL -lGLESv2" \

QMAKE_INCDIR_OPENVG="/opt/vc/include /opt/vc/include/interface/vcos/pthreads /opt/vc/include/interface/vmcs_host/linux" \
QMAKE_LIBDIR_OPENVG="/opt/vc/lib" \
QMAKE_LIBS_OPENVG="-lEGL -lOpenVG -lGLESv2" \

EGLFS_DEVICE_INTEGRATION=eglfs_brcma

echo ">>>> RPi EGLFS status:"
less config.summary | grep Raspberry
	
echo "It's time for: make & make install & ldconfig"	

