# vkQt
repository with tips to build Vulkan support in Qt 5.10+ (defauld builds from QtSDK/qt.io don't include Vulkan support)

# Table of Contents
1. [Build](#build)
	1. [Qt for Android](#qt-for-android)
		1. [clang](#clang)
			1. [32bit](#32bit-clang)
			2. [64bit](#64bit-clang)
			3. [QtCreator](#qtcreator-clang)
		2. [gcc](#gcc)
			1. [32bit](#32bit-gcc)
			2. [64bit](#64bit-gcc)
2. [Qt Vulkan examples](#qt-vulkan-examples) 

## Build
**Qt 5.10 required**
- looks like [Qt Online Installer](http://download.qt.io/official_releases/online_installers/), which include Qt 5.10 beta(in time of writing), build **without vulkan support**

### Qt for Android

#### clang 
- 5.0 (NDK 16)
Qt 5.10 can be build with CLang 5.0 from NDK 16(early version not tested). While Qt 5.7+ itself required C++11, some of example can be compiled only with C++14 option

##### 32bit

`./configure  -prefix /path/where/to/install/qt_arm32_clang -c++std c++14 -release -opensource -confirm-license -xplatform android-clang -nomake tests -nomake examples -android-ndk /home/az/sdk/android/ndk -android-sdk /home/az/sdk/android/sdk -android-ndk-host linux-x86_64  -android-ndk-platform android-21 -android-arch armeabi-v7a -skip qttranslations -skip qtserialport -no-warnings-are-errors -v`

##### 64bit

`./configure  -prefix /path/where/to/install/qt_arm64_clang -c++std c++14 -release -opensource -confirm-license  -xplatform android-clang -nomake tests -nomake examples -android-ndk /home/az/sdk/android/ndk -android-sdk /home/az/sdk/android/sdk -android-ndk-host linux-x86_64  -android-ndk-platform android-21 -android-arch arm64-v8a -skip qttranslations -skip qtserialport -no-warnings-are-errors -v`

##### QtCreator
due to issues with current version of QtCreator\clang compiler for Android it's necessary to select a gcc as a build comliper for clang build'
 
#### gcc 
- 4.9(NDK 10)

##### 32bit
To build Qt 5.10+ with vulkan support([added by Laszlo Agocs from KDab](http://blog.qt.io/blog/2017/06/06/vulkan-support-qt-5-10-part-1/)) on Android at present moment(due to bugs in Android NDK) to use NDK10;
Since Vulkan support exist starting from Android-24, you need to copy platform files from latest NDK(15 in time of writing this) to NDK10 and build Qt
(i.e. copy NDK15\platforms\android-24 to NDK10\platforms\);
so, build parameters for qt is following: -xplatform android-g++ -android-ndk-platform android-24 -android-toolchain-version 4.9 

`./configure  -prefix /path/where/to/install/qt -android-arch armeabi-v7a -xplatform android-g++ -android-ndk-platform android-24 -opengl es2 --disable-rpath -nomake tests -nomake examples -android-ndk /path/to/your/android/ndk10 -android-sdk /path/to/your/android/sdk -android-ndk-host linux-x86_64 -android-toolchain-version 4.9 -skip qttranslations -skip qtwebengine -skip qtserialport -no-warnings-are-errors -opensource -confirm-license`

##### 64bit
- can't be compiled due to errors

## Qt Vulkan examples
Nice Vulkan examples you can find in `qt/qtbase/examples/vulkan` - works perfect on Desktop, while have some UI-related issues on Android (due to usage of widgets)
