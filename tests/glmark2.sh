mkdir ~/sdk
cd ~/sdk
mkdir tools
cd tools
mkdir tests
cd tests
git clone https://github.com/glmark2/glmark2.git
cd glmark2
./waf configure --with-flavors=x11-glesv2 --destdir=/usr/local
./waf
sudo ./waf install
./waf configure --with-flavors=x11-gl --destdir=/usr/local
./waf
sudo ./waf install
cd ..
sudo rm -r glmark2
touch glmark2.installed
touch glmark2-es2.installed
