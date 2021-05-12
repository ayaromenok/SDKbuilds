TBB_VER=`cat _TBB_version.txt`
SRC_DIR=~/sdk/src
BUILD_DIR=~/sdk/build

echo "Install Intel (one)TBB ${TBB_VER}: src in ${SRC_PATH}, build in ${BUILD_PATH}"

echo ">>>> get TBB - ${TBB_VER}"
mkdir "${SRC_DIR}" -p
mkdir "${BUILD_DIR}" -p
cd ${SRC_DIR}

TBB_SRC_DIR=oneTBB-${TBB_VER}
if test -d "$TBB_SRC_DIR"; then
    echo "$TBB_SRC_DIR already exists."
else
    echo "$TBB_SRC_DIR does not exists."
    wget https://github.com/oneapi-src/oneTBB/archive/refs/tags/v${TBB_VER}.tar.gz
    echo "Extracting (one)TBB-${TBB_VER}"
    tar xf v${TBB_VER}.tar.gz
    rm  v${TBB_VER}.tar.gz
    echo "Done"
fi


TBB_BUILD_DIR=${BUILD_DIR}/oneTBB-${TBB_VER}
if test -d "$TBB_BUILD_DIR"; then
    echo "$TBB_BUILD_DIR already exists. Remove it to rebuild from scratch."
else
    echo "$TBB_BUILD_DIR does not exists."
    mkdir "${TBB_BUILD_DIR}"
    cd  "${TBB_BUILD_DIR}"
    cmake  \
	    ${SRC_DIR}/${TBB_SRC_DIR}
    make -j 4
    sudo make install
    sudo ldconfig
fi


