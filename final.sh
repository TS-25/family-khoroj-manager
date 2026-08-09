#!/bin/bash

npm install @capacitor/core @capacitor/cli
npm install @capacitor/android

npx cap add android
npx cap sync
mkdir -p resources
cp icon.png resources/icon.png
npm install @capacitor/assets --save-dev
npx capacitor-assets generate --android
npx cap sync
cd android
chmod +x gradlew
./gradlew assembleDebug
