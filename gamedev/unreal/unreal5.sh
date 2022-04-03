echo "UE5 required libssl 1.x to run setup.sh -to  avoid error: No usable version of libssl was found
"
sudo apt install libssl1.1 -y
mkdir ~/sdk
cd ~/sdk
git clone git@github.com:EpicGames/UnrealEngine.git --branch ue5-main --single-branch --depth 1 ue5
cd  ue5
./Setup.sh
./GenerateProjectFiles.sh
