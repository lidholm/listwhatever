echo "flutter.sdk=/sdks/flutter/" > android/local.properties
echo sdk.dir=/opt/android-sdk-linux/ >> android/local.properties
echo flutter.buildMode=debug >> android/local.properties
echo flutter.buildMode=release >> android/local.properties
echo flutter.versionName=0.0.39 >> android/local.properties
echo flutter.versionCode=1 >> android/local.properties

cd android
echo "==="
echo "==="
flutter build apk --flavor development
chmod +x ./gradlew
./gradlew app:assembleAndroidTest
./gradlew app:assembleDebug -Ptarget=/builds/lidholm/allmylists/integration_test/main_test.dart
cd ..
echo "==="
cp build/app/outputs/apk/development/debug/app-development-debug.apk .

ls -lR build/app/outputs/apk
cp build/app/outputs/apk/androidTest/development/debug/app-development-debug-androidTest.apk .
echo "==="
pwd
echo "==="
