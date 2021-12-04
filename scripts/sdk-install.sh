#!/bin/bash

export PATH=${PATH}:${ANDROID_HOME}/cmdline-tools/latest/bin:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/tools:${ANDROID_HOME}/tools/bin:

echo "Downloading SDK tools"
curl http://dl.google.com/android/repository/commandlinetools-linux-7583922_latest.zip -o sdk-tools-linux.zip

unzip sdk-tools-linux.zip -d cmdline-tools
mv cmdline-tools/cmdline-tools/ cmdline-tools/latest
rm sdk-tools-linux.zip

echo "Accepting SDK licenses"
yes | sdkmanager --licenses

echo "Installing SDK $1"
sdkmanager "build-tools;$1"
sdkmanager --package_file=/opt/scripts/package-list-minimal.txt


