sudo apt remove htop -y
sudo apt install libncurses-dev libsensors4-dev build-essential autoconf -y 
cd ~
mkdir sdk
cd sdk
mkdir src
cd src
mkdir tools
cd tools
git clone https://github.com/htop-dev/htop.git
cd htop
./autogen.sh
./configure
make -j 4
make install
sudo make install
sudo ln -s /usr/local/bin/htop /usr/bin/htop


