sudo apt install cmake clang-10 libclang-10-dev libhwloc-dev hwloc libclang-cpp10-dev -y
sudo rm llvm-config
sudo ln -s /usr/bin/llvm-config-10 /usr/bin/llvm-config
mkdir ~/sdk
cd  ~/sdk
mkdir src
cd src
mkdir pocl
cd pocl

wget https://github.com/pocl/pocl/archive/v1.6.tar.gz
tar xf v1.6.tar.gz

cd ../..
mkdir build
cd build
mkdir pocl-1.6
cd pocl-1.6

cmake \
../../src/pocl/pocl-1.6

make -j 4
sudo make install
sudo ldconfig
