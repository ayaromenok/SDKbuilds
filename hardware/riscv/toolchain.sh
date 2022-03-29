
sudo apt install gawk device-tree-compiler texinfo
mkdir sdk
cd sdk
mkdir riscv
cd riscv


git clone https://github.com/riscv/riscv-isa-sim.git --depth 1
cd riscv-isa-sim
mkdir build
cd build
../configure --prefix=/usr/local
make -j 4
make install
cd ../..


git clone https://github.com/riscv/riscv-gnu-toolchain.git --branch rvv-intrinsic --single-branch --depth 1
cd riscv-gnu-toolchain/
git submodule update --init --recursive --depth 1 riscv-binutils riscv-gcc                         riscv-glibc riscv-dejagnu riscv-newlib riscv-gdb
mkdir build
cd build
../configure --prefix=/usr/local --enable-multilib
make -j 4
make install
cd ../..


git clone --depth 1 https://github.com/riscv/riscv-pk.git
cd riscv-pk
mkdir build
cd build
../configure --prefix=/usr/local --host=riscv64-unknown-elf
make -j 4
make install
cd ../..

