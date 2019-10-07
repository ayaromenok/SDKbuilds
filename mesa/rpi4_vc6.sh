sudo apt-get install build-essential git meson
sudo apt-get build-dep mesa

git clone https://gitlab.freedesktop.org/anholt/mesa.git
cd mesa
git checkout v3d-opt-sub
#git checkout v3d-cs
