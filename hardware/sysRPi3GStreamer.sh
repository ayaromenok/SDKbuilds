echo ">>>> Setup RPi3/GStreamer good/bad"

sudo apt-get update
sudo apt-get install libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev gstreamer1.0-plugins-base \
gstreamer1.0-plugins-good \
gstreamer1.0-plugins-bad libgstreamer-plugins-bad1.0-dev \
gstreamer1.0-tools
