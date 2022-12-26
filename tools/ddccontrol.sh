sudo apt-get install autopoint intltool libpci-dev libpciaccess-dev libgtk2.0-dev
mkdir ~/sdk/build -p
cd ~/sdk/build

git clone https://github.com/ddccontrol/ddccontrol.git
cd  ddccontrol
./autogen.sh

./configure --prefix=/usr/ --sysconfdir=/etc --libexecdir=/usr/lib

make -j$(nproc)
sudo make install