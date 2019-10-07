echo "installing HTOP with CPU Temperature/Frequency"
mkdir ~/sdk
cd ~/sdk
mkdir src
cd src
mkdir tools
cd tools
git clone https://github.com/wbenny/htop.git
cd htop
sudo apt install libncurses5-dev
./autogen.sh
./configure --disable-unicode
make -j 4
sudo make install
