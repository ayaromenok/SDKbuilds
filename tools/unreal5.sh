mkdir ~/sdk
cd ~/sdk
git clone git@github.com:EpicGames/UnrealEngine.git --branch ue5-main --single-branch --depth 1
cd  UnrealEngine
./Setup.sh
./GenerateProjectFiles.sh
