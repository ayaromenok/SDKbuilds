#toolchain for ue4/ue5 http://cdn.unrealengine.com/Toolchain_Linux/native-linux-v19_clang-11.0.1-centos7.tar.gz
mkdir ~/sdk
cd ~/sdk
git clone git@github.com:EpicGames/UnrealEngine.git --branch 4.27.2-release --single-branch --depth 1 ue4
cd  ue4
./Setup.sh
./GenerateProjectFiles.sh
