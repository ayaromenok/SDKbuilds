mkdir ~/sdk/src
cd ~/sdk/src
git clone https://github.com/ekondis/mixbench

mkdir ~/sdk/build/mixbench
cd ~/sdk/build/mixbench

mkdir build_cuda

cd build_cuda
echo "Xavier (Volta)"
cmake -DCMAKE_CUDA_ARCHITECTURES="70" -DTRT_LIB_DIR=/usr/lib/aarch64-linux-gnu/ -DCMAKE_C_COMPILER=/usr/bin/gcc -DCMAKE_CUDA_COMPILER=/usr/local/cuda-11/bin/nvcc -DCMAKE_CXX_COMPILER=/usr/bin/g++ ../../../src/mixbench/mixbench-cuda/
#echo "GeForce10 0 (Pascal)"
#cmake -DCMAKE_CUDA_ARCHITECTURES="60" -DTRT_LIB_DIR=/usr/lib/aarch64-linux-gnu/ -DCMAKE_C_COMPILER=/usr/bin/gcc -DCMAKE_CUDA_COMPILER=/usr/local/cuda-11/bin/nvcc -DCMAKE_CXX_COMPILER=/usr/bin/g++ ../mixbench-cuda/
#echo "Nano (Maxwell)"
#cmake -DCMAKE_CUDA_ARCHITECTURES="50" -DTRT_LIB_DIR=/usr/lib/aarch64-linux-gnu/ -DCMAKE_C_COMPILER=/usr/bin/gcc -DCMAKE_CUDA_COMPILER=/usr/local/cuda-10/bin/nvcc -DCMAKE_CXX_COMPILER=/usr/bin/g++ ../mixbench-cuda/
make -j$(nproc)
sudo cp ./mixbench-cuda /usr/local/bin

cd ..

mkdir build_cpu
cd build_cpu
cmake ../../../src/mixbench/mixbench-cpu/
make -j$(nproc)
sudo cp ./mixbench-cpu /usr/local/bin


