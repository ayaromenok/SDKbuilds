sudo apt install php-cli php-gd php-xml php-zip inxi
wget http://phoronix-test-suite.com/releases/repo/pts.debian/files/phoronix-test-suite_10.8.3_all.deb
sudo dpkg -i phoronix-test-suite_10.8.3_all.deb
rm -f *.deb

inxi -Fc0
#phoronix-test-suite benchmark 1709271-TY-1704029RI26
