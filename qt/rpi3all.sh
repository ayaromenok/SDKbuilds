echo ">>>> setup qt5"

# ../hardware/rpi3.sh
mkdir ~/sdk
cd ~/sdk
mkdir src
cd src
mkdir qt
cd qt

#wget http://download.qt.io/official_releases/qt/5.12/5.12.0/single/qt-everywhere-src-5.12.0.tar.xz
#tar xf qt-everywhere-src-5.12.0.tar.xz

cd ../..
mkdir build
cd build
mkdir qt
cd qt

echo ">>>> configure Qt5"
PKG_CONFIG_LIBDIR=/usr/lib/arm-linux-gnueabihf/pkgconfig:/usr/share/pkgconfig \
../../src/qt/qt-everywhere-src-5.12.0/configure \
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
QMAKE_CFLAGS="-march=armv8-a -mtune=cortex-a53 -mfpu=crypto-neon-fp-armv8" \
QMAKE_CXXFLAGS="-march=armv8-a -mtune=cortex-a53 -mfpu=crypto-neon-fp-armv8" \
QMAKE_LIBS_EGL="-lEGL -lGLESv2" QMAKE_LIBS_OPENVG="-lEGL -lOpenVG -lGLESv2" \
QMAKE_LIBDIR_OPENGL_ES2=/opt/vc/lib QMAKE_INCDIR_OPENGL_ES2="/opt/vc/include /opt/vc/include/interface/vcos/pthreads /opt/vc/include/interface/vmcs_host/linux" \
QMAKE_LIBDIR_EGL=/opt/vc/lib QMAKE_INCDIR_EGL="/opt/vc/include /opt/vc/include/interface/vcos/pthreads /opt/vc/include/interface/vmcs_host/linux" \
QMAKE_LIBDIR_OPENVG=/opt/vc/lib QMAKE_INCDIR_OPENVG="/opt/vc/include /opt/vc/include/interface/vcos/pthreads /opt/vc/include/interface/vmcs_host/linux" \
-DEGLFS_DEVICE_INTEGRATION=eglfs_brcma

echo ">>>> RPi EGLFS status:"
less config.summary | grep Raspberry
#-skip qtlocation \
#-no-feature-geoservices_mapboxgl \
#-skip qtwayland \
#-skip qtwebengine \
#-skip qtlocation \
#-skip qtwebchannel \
#-skip qtwebglplugin \
#-skip qtwebsockets \
#-skip qtwebview \
#-skip qtcanvas3d \
#-skip qtdatavis3d \
#-skip qtvirtualkeyboard \
