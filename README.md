# vkQt
repo for some Qt 5.10 tests

## Qt for Android

To build Qt 5.10 with vulkan support([added by Laszlo Agocs from KDab](http://blog.qt.io/blog/2017/06/06/vulkan-support-qt-5-10-part-1/)) on Android at present moment(due to bugs in Android NDK) to use NDK10;
Since Vulkan support exist starting from Android-24, you need to copy platform files from latest NDK(15 in time of writing this) to NDK10 and build Qt
(i.e. copy NDK15\platforms\android-24 to NDK10\platforms\);
so, build parameters for qt is following: -xplatform android-g++ -android-ndk-platform android-24 -android-toolchain-version 4.9 

`./configure  -prefix /path/where/to/install -android-arch armeabi-v7a **-xplatform android-g++ -android-ndk-platform android-24** -opengl es2 --disable-rpath -nomake tests -nomake examples **-android-ndk /path/to/your/android/ndk10** -android-sdk /path/to/your/android/sdk -android-ndk-host linux-x86_64 **-android-toolchain-version 4.9** -skip qttranslations -skip qtwebengine -skip qtserialport -no-warnings-are-errors -opensource -confirm-license`
