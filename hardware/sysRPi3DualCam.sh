ehco "setup RPi DualCam"

cd /tmp

wget https://www.raspberrypi.org/documentation/hardware/computemodule/dt-blob-dualcam.dts
dtc -I dts -O dtb -o dt-blob-dualcam.dtb dt-blob-dualcam.dts
sudo cp dt-blob-dualcam.dtb /boot/dt-blob.bin
echo "bcm2835-v4l2" | sudo tee /etc/modules
echo "start_x=1" | sudo tee /etc/modules

echo "plz, reboot"
echo "to check: vcgencmd get_camera"
