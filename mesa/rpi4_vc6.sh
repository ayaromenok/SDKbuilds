sudo apt-get install build-essential git meson
sudo apt-get build-dep mesa

mkdir ~/sdk
cd ~/sdk
mkdir src
cd src

# #old - git clone https://gitlab.freedesktop.org/anholt/mesa.git
cd mesa
# #use master for test
#git checkout v3d-opt-sub
#git checkout v3d-cs
meson build \
	--prefix=/usr \
	--libdir=/usr/lib/arm-linux-gnueabihf \
	-Dbuildtype=release \
	-Dplatforms=x11,drm,surfaceless \
	-Ddri-drivers= \
	-Dgallium-drivers=v3d

ninja -C build \
sudo -E ninja -C build install
