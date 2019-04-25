echo ">>>> Setup RPi3 system"

echo ">>>> Update system"
sudo apt-get update

echo ">>>> Setup basic libs"
sudo apt-get install build-essential libfontconfig1-dev libdbus-1-dev \
libfreetype6-dev libicu-dev libinput-dev libxkbcommon-dev libsqlite3-dev \
libssl-dev libpng-dev libjpeg-dev libglib2.0-dev libraspberrypi-dev cmake \
libtiff-dev libavcodec-dev libavformat-dev libswscale-dev libv4l-dev \
libx264-dev mc cmake unzip pkg-config 

echo ">>>> Setup gstreamer"
#./sysRPi3GStreamer.sh

echo ">>>> Make BRCM sym-links"
#sudo ln -s /opt/vc/lib/libbrcmEGL.so /usr/local/lib/libEGL.so
#sudo ln -s /opt/vc/lib/libbrcmGLESv2.so /usr/local/lib/libGLESv2.so
#sudo ln -s /opt/vc/lib/libbrcmOpenVG.so /usr/local/lib/libOpenVG.so
#sudo ln -s /opt/vc/lib/libbrcmWFC.so /usr/local/lib/libWFC.so
#sudo ln -s /opt/vc/lib/libopenmaxil.so /usr/local/lib/libopenmaxil.so
#sudo ln -s /opt/vc/lib/libbcm_host.so /usr/local/lib/libbcm_host.so

#sudo ln -s /opt/vc/include/EGL /usr/local/include/EGL
#sudo ln -s /opt/vc/include/GLES /usr/local/include/GLES
#sudo ln -s /opt/vc/include/GLES2 /usr/local/include/GLES2
#sudo ln -s /opt/vc/include/KHR /usr/local/include/KHR
#sudo ln -s /opt/vc/include/IL /usr/local/include/IL
#sudo ln -s /opt/vc/include/VG /usr/local/include/VG
#sudo ln -s /opt/vc/include/WF /usr/local/include/WF
#sudo ln -s /opt/vc/include/interface /usr/local/include/interface
#sudo ln -s /opt/vc/include/vcinclude /usr/local/include/vcinclude
#sudo ln -s /opt/vc/include/bcm_host.h /usr/local/include/bcm_host.h

echo "bcm2835-v4l2" | sudo tee /etc/modules
sudo modprobe bcm2835-v4l2

echo ">>>> Video4Linux check"
v4l2-ctl --list-formats

echo ">>>> Camera check"
vcgencmd get_camera

echo ">>>> RPi3 system setup finished"
 
