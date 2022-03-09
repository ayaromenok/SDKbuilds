sudo apt install libncurses-dev libsensors4-dev
cd ~
mkdir sdk
cd sdk
mkdir src
cd src
mkdir tools
cd tools
git clone https://github.com/htop-dev/htop.git
./autogen.sh
./configure
make
make install
ln -s /usr/local/bin/htop /usr/bin/htop


