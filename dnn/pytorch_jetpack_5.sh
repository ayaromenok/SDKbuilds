sudo apt-get -y install autoconf bc build-essential g++-8 gcc-8 clang-8 lld-8 gettext-base gfortran-8 iputils-ping libbz2-dev libc++-dev libcgal-dev libffi-dev libfreetype6-dev libhdf5-dev libjpeg-dev liblzma-dev libncurses5-dev libncursesw5-dev libpng-dev libreadline-dev libssl-dev libsqlite3-dev libxml2-dev libxslt-dev locales moreutils openssl python-openssl rsync scons python3-pip libopenblas-dev libclang-8-dev
export TORCH_INSTALL=https://developer.download.nvidia.cn/compute/redist/jp/v502/pytorch/torch-1.13.0a0+410ce96a.nv22.12-cp38-cp38-linux_aarch64.whl
python3 -m pip install --upgrade pip; 
python3 -m pip install aiohttp numpy=='1.19.4' scipy=='1.5.3' 
export "LD_LIBRARY_PATH=/usr/lib/llvm-8/lib:$LD_LIBRARY_PATH"; 
python3 -m pip install --upgrade protobuf; 
python3 -m pip install --no-cache $TORCH_INSTALL
python3 -m pip install torchvision

echo "Check Torch and TorchVision install, check CUDA support"
python3 -c "exec(\"import torch\nimport torchvision\ndevice=torch.cuda.is_available()\nprint(device)\")"