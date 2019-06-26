sudo apt install cmake clang-7 libclang-7-dev libhwloc-dev hwloc
sudo ln -s /usr/bin/llvm-config-7 /usr/bin/llvm-config
mkdir ~/sdk
cd  ~/sdk
mkdir src
cd src
mkdir pocl
cd pocl

wget https://github.com/pocl/pocl/archive/v1.3.tar.gz
tar xf v1.3.tar.gz

cd ../..
mkdir build
cd build
mkdir pocl
cd pocl

cmake \
-D ENABLE_CUDA=ON \
../../src/pocl/pocl-1.3
