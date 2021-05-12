EMBREE_VER=`cat _EMBREE_version.txt`
SRC_DIR=~/sdk/src
BUILD_DIR=~/sdk/build

echo "Install Intel EMBREE ${EMBREE_VER}: src in ${SRC_PATH}, build in ${BUILD_PATH}"
sudo apt install libglfw3-dev -y
echo ">>>> get EMBREE - ${EMBREE_VER}"
mkdir "${SRC_DIR}" -p
mkdir "${BUILD_DIR}" -p
cd ${SRC_DIR}

EMBREE_SRC_DIR=embree-${EMBREE_VER}
if test -d "$EMBREE_SRC_DIR"; then
    echo "$EMBREE_SRC_DIR already exists."
else
    echo "$EMBREE_SRC_DIR does not exists."
    wget https://github.com/embree/embree/archive/refs/tags/v${EMBREE_VER}.tar.gz
    echo "Extracting EMBREE-${EMBREE_VER}"
    tar xf v${EMBREE_VER}.tar.gz
    rm  v${EMBREE_VER}.tar.gz
    echo "Done"
fi


EMBREE_BUILD_DIR=${BUILD_DIR}/embree-${EMBREE_VER}
if test -d "$EMBREE_BUILD_DIR"; then
    echo "$EMBREE_BUILD_DIR already exists. Remove it to rebuild from scratch."
else
    echo "$EMBREE_BUILD_DIR does not exists."
    mkdir "${EMBREE_BUILD_DIR}"
    cd  "${EMBREE_BUILD_DIR}"
    cmake  \
	    -DEMBREE_ISPC_SUPPORT=NO \
	    ${SRC_DIR}/${EMBREE_SRC_DIR}
    make -j 4
    sudo make install
    sudo ldconfig
fi


