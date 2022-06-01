mkdir ~/sdk
cd ~/sdk
mkdir riscv
cd riscv

sudo apt install qemu-system-misc qemu-user-static binfmt-support ninja-build opensbi u-boot-qemu -y
git clone https://git.qemu.org/git/qemu.git
cd qemu
#./configure --static --disable-system --target-list=riscv64-linux-user
./configure --target-list=riscv64-linux-user
make -j 4
sudo make install
sudo cp ./qemu-riscv64rvv.sh /usr/local/bin/


cat >/tmp/qemu-riscv64 <<EOF
package qemu-user-static 
type magic
offset 0
magic \x7f\x45\x4c\x46\x02\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\xf3\x00
mask \xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff
interpreter /usr/local/bin/qemu-riscv64rvv.sh
EOF

sudo update-binfmts --import /tmp/qemu-riscv64

