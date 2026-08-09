#!/bin/bash

sudo apt update && sudo apt upgrade -y
sudo apt install -y wget unzip curl git openjdk-17-jdk
java -version
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt install -y nodejs
node -v
npm -v
cd ~/Downloads
wget https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2024.2.1.12/android-studio-2024.2.1.12-linux.tar.gz
tar -xzf android-studio-*.tar.gz -C ~/
~/android-studio/bin/studio.sh
echo 'export ANDROID_HOME=$HOME/Android/Sdk' >> ~/.bashrc
echo 'export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/build-tools/34.0.0' >> ~/.bashrc
source ~/.bashrc
sdkmanager --version
yes | sdkmanager --licenses
