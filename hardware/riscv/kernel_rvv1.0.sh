#git clone https://github.com/intel-lab-lkp/linux.git
#git checkout Greentime-Hu/riscv-Add-vector-ISA-support/20220511-163610
mkdir ~/sdk/src/riscv
cp ./config ~/sdk/src/riscv/.config

cd ~/sdk/src/riscv
echo "GCC-12 or CLANG-13 required"
git clone https://github.com/intel-lab-lkp/linux.git --single-branch --depth 1 --branch Greentime-Hu/riscv-Add-vector-ISA-support/20220511-163610

# Native build - too slow
#sudo apt install libssl-dev gcc-12 g++-12

# cross-compilation
#sudo apt install gcc-12-riscv64-linux-gnu g++-12-riscv64-linux-gnu
#sudo ln -s /usr/bin/riscv64-linux-gnu-g++-12 /usr/bin/riscv64-linux-gnu-g++
#sudo ln -s /usr/bin/riscv64-linux-gnu-gcc-12 /usr/bin/riscv64-linux-gnu-gcc
export ARCH=riscv
#export CC=/usr/bin/riscv64-linux-gnu-
export CROSS_COMPILE=~/x-tools/riscv64-unknown-linux-gnu/bin/riscv64-unknown-linux-gnu-
cd linux
cp ../.config ./
make menuconfig

make -j 4
mkdir ../out
make modules_install INSTALL_MOD_PATH=~/sdk/src/riscv/out
cd ..

cp ~/sdk/src/riscv/linux/arch/riscv/boot/Image out/
cp ~/sdk/src/riscv/linux/.config out/config

cd ~/sdk/src/riscv/out
rm lib/modules/5.18.0-rc6-g1494a43aa2d0/build
rm lib/modules/5.18.0-rc6-g1494a43aa2d0/source
#scp -rP 22222 * pi@127.0.0.1:/home/pi/share/