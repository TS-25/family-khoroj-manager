#!/bin/bash

sudo apt update 
sudo apt install -y wget unzip curl git openjdk-17-jdk
java -version

# Create SDK directory
mkdir -p ~/Android/Sdk/cmdline-tools
cd ~/Android/Sdk/cmdline-tools

# Download the latest command-line tools (check https://developer.android.com/studio#command-tools for the newest link)
wget https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip -O cmdline-tools.zip
unzip cmdline-tools.zip
rm cmdline-tools.zip

# The unzip creates a folder called "cmdline-tools" — rename it to "latest" as required by Android's folder structure
mv cmdline-tools latest
echo 'export ANDROID_HOME=$HOME/Android/Sdk' >> ~/.bashrc
echo 'export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/build-tools/34.0.0' >> ~/.bashrc
source ~/.bashrc

# Verify
sdkmanager --version
sdkmanager --sdk_root=$ANDROID_HOME "platform-tools" "platforms;android-34" "build-tools;34.0.0"

# Accept all licenses (required, otherwise Gradle build fails)
yes | sdkmanager --sdk_root=$ANDROID_HOME --licenses
unzip family-khoroj-manager.zip
cd family-khoroj-manager
npm install
