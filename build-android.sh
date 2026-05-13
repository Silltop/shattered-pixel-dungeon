#!/bin/bash
set -e

echo "sdk.dir=$HOME/android-sdk" > android/local.properties
export ANDROID_HOME="$HOME/android-sdk"

./gradlew android:assembleRelease

~/android-sdk/build-tools/36.0.0/apksigner sign \
  --ks ~/my-release-key.jks \
  --ks-key-alias my-key \
  --out ~/silltop-signed.apk \
  android/build/outputs/apk/release/android-release-unsigned.apk

echo "Done: ~/silltop-signed.apk"
