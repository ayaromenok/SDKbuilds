#!/bin/sh
echo ">>>> Setup OnnxRunTime on TensorRT/CUDA"
mkdir ~/sdk
cd ~/sdk
mkdir src
cd src
mkdir onnxruntime
cd onnxruntime
git clone https://github.com/microsoft/onnxruntime.git
git clone https://github.com/microsoft/onnxruntime-inference-examples.git
git clone https://github.com/microsoft/onnxruntime-training-examples.git
cd onnxruntime

echo ">>>> Configure OnnxRunTime"
#../../src/onnxruntime/onnxruntime/build.sh --cudnn_home /usr/local/cuda/lib --cuda_home /usr/local/cuda --use_tensorrt --tensorrt_home /usr/local  --config Release --build_shared_lib --parallel --cmake_extra_defines CMAKE_INSTALL_PREFIX=/usr/local
# --parallel required aprox 4-5GB per thread while compilit CUDA part
./build.sh --cudnn_home /usr/local/cuda/lib --cuda_home /usr/local/cuda --use_tensorrt --tensorrt_home /usr/local  --config Release --build_shared_lib --cmake_extra_defines CMAKE_INSTALL_PREFIX=/usr/local

cd build/Linux/Release

sudo make install
#make -j 4
#sudo make -j 4 install
#
#
