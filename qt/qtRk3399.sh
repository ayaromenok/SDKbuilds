echo ">>>> Setup Qt5 base"

#../hardware/rpi3.sh

echo ">>>> get Qt5 base"
mkdir ~/sdk
cd ~/sdk
mkdir src
cd src
mkdir qt
cd qt

wget http://download.qt.io/official_releases/qt/5.12/5.12.3/submodules/qtbase-everywhere-src-5.12.3.tar.xz
tar xf qtbase-everywhere-src-5.12.3.tar.xz

cd ../..
mkdir build
cd build
mkdir qt
cd qt

echo ">>>> Configure Qt5 base"
PKG_CONFIG_LIBDIR=/usr/lib/aarch64-linux-gnu/pkgconfig:/usr/share/pkgconfig \
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
-no-glib \
-prefix /usr/local \
-qpa eglfs \
QMAKE_CFLAGS="-march=armv8-a -mtune=cortex-a72" \
QMAKE_CXXFLAGS="-march=armv8-a -mtune=cortex-a72" \
QMAKE_LIBS_EGL="-lEGL -lGLESv2" \
QMAKE_LIBDIR_OPENGL_ES2=/usr/lib/aarch64-linux-gnu QMAKE_INCDIR_OPENGL_ES2="/usr/include" \
QMAKE_LIBDIR_EGL=/usr/lib/aarch64-linux-gnu QMAKE_INCDIR_EGL="/usr/include" \

echo ">>>> Rk3399 EGLFS status:"
less config.summary | grep Mali
	
echo "It's time for: make & make install & ldconfig"	

