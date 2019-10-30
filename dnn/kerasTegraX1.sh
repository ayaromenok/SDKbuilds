echo "Py 3.6+JetPack4.2.1"
sudo apt update
sudo apt-get install python3.6-dev libhdf5-serial-dev hdf5-tools libhdf5-dev zlib1g-dev zip libjpeg8-dev
sudo apt-get install python3-pip
sudo pip3 install -U pip
sudo pip3 install -U numpy grpcio absl-py py-cpuinfo psutil portpicker six mock requests gast h5py astor termcolor protobuf keras-applications keras-preprocessing wrapt google-pasta
sudo pip3 install --pre --extra-index-url https://developer.download.nvidia.com/compute/redist/jp/v42 tensorflow-gpu==1.14.0+nv19.9
sudo pip3 install keras