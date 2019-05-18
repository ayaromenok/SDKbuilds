echo ">>>> Setup Qt5 base"

echo ">>>> get Qt5 base"
mkdir ~/sdk
cd ~/sdk
mkdir src
cd src
mkdir qt
cd qt

wget http://download.qt.io/official_releases/qt/5.12/5.12.1/submodules/qtbase-everywhere-src-5.12.3.tar.xz
tar xf qtbase-everywhere-src-5.12.3.tar.xz

cd ../..
mkdir build
cd build
mkdir qtDesktopGL
cd qtDesktopGL

echo ">>>> Configure Qt5 base"
PKG_CONFIG_LIBDIR=/usr/lib/pkgconfig:/usr/share/pkgconfig \
../../src/qt/qtbase-everywhere-src-5.12.3/configure \
-v \
-opengl desktop \
-opensource -confirm-license -release \
-force-pkg-config \
-nomake examples -no-compile-examples \
-qt-pcre \
-no-pch \
-ssl \
-no-eglfs \
-prefix /usr/local \
-xcb \
-qpa xcb \
QMAKE_CFLAGS="-march=native -mtune=cortex-a15" \
QMAKE_CXXFLAGS="-march=native -mtune=cortex-a15"

echo ">>>> Tegra K1 OpenGL\Vulkan status:"
less config.summary | grep OpenGL
less config.summary | grep Vulkan

echo " "	
echo "It's time for: make & make install & ldconfig"	

