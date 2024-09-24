echo "hello"
export current_time=$(date +"%Y-%m-%d %H:%M:%S")
echo $current_time
sed "s/<datetime>/$current_time/g" lib/standard/main/main_development.dart > lib/standard/main/main_development2.dart
cat lib/standard/main/main_development2.dart
flutter build web --profile -t lib/standard/main/main_development2.dart
firebase deploy --only hosting
