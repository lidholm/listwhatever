echo "deployAndroidBundleToGooglePlayStore"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

alias bundletool='java -jar /bundletool-all.jar'
grep "version: " pubspec.yaml

cd android
echo "===---===="
echo "===---===="
ls -l /builds/lidholm/allmylists/app-production-release.aab

java -jar /bundletool-all.jar dump manifest --bundle /builds/lidholm/allmylists/app-production-release.aab --xpath /manifest/@android:versionCode

if [ "$IS_DRAFT" = true ] ; then
    echo "Deploying draft app"
    bundle exec fastlane upload_to_play_store --aab /builds/lidholm/allmylists/app-production-release.aab --track alpha   --release_status draft
else
    echo "Deploying non draft app"
    bundle exec fastlane upload_to_play_store --aab /builds/lidholm/allmylists/app-production-release.aab --track alpha
fi
