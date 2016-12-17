#!/bin/sh

publish(){
   cd $projectLocation
   cordova plugin rm cordova-plugin-console
   cordova build --release android
   jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore "$keyStoreLocation" "$projectLocation/platforms/android/build/outputs/apk/android-release-unsigned.apk" $alias_name
   zipalign -v 4 "$projectLocation/platforms/android/build/outputs/apk/android-release-unsigned.apk" "$appName.apk"
}

echo 
echo "* Android Package Publishing *"
echo 
echo 
echo "Please Note : This script only works if jarsigner and zipalign is present in systems Path."
echo 
echo "> Drop your project root folder : "
read projectLocation
echo 
echo "> Drop your App's keystore File : "
read keyStoreLocation
echo 
echo "> Enter desired App name : "
read appName
echo 
echo "> Enter keystore Alias name : "
read alias_name
echo 
echo
publish