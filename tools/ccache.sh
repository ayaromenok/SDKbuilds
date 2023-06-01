mkdir build
cd build
cmake -DZSTD_FROM_INTERNET=ON -DHIREDIS_FROM_INTERNET=ON ..
make -j$(nproc)
make install

#cp ccache /usr/local/bin/
ln -s ccache /usr/local/bin/gcc
ln -s ccache /usr/local/bin/g++
ln -s ccache /usr/local/bin/cc
ln -s ccache /usr/local/bin/c++

#setup
#ccache -F 0
ccache -M 12
ccache -s
#Empty the cache and reset the stats:
#ccache -C -z