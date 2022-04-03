mkdir ~/sdk
cd ~/sdk
git clone git@github.com:EpicGames/UnrealEngine.git --branch 4.27.2-release --single-branch --depth 1 ue4
cd  ue4
./Setup.sh
./GenerateProjectFiles.sh
