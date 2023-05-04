echo "deployAndroidBundleToGooglePlayStore"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

alias bundletool='java -jar /bundletool-all.jar'

#cp daggerImport/release.aab .

cd android
echo "===---===="
echo "===---===="
ls -l /builds/lidholm/listanything/app-production-release.aab

java -jar /bundletool-all.jar dump manifest --bundle /builds/lidholm/listanything/app-production-release.aab --xpath /manifest/@android:versionCode

bundle exec fastlane upload_to_play_store --aab /builds/lidholm/listanything/app-production-release.aab --track internal
echo "===---===="
