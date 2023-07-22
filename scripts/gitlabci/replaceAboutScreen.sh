echo "Replacing version"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

cd android
bundle --full-index
echo "\n\n\n\n\n\n\n\n\n"
echo "===---===="
bundle exec fastlane run google_play_track_version_codes track:internal
echo "\n\n\n\n"
echo "===---===="
FIRST_TRY_TO_SEE_IF_THEY_ARE_DIFFERENT=`bundle exec fastlane run google_play_track_version_codes track:internal | grep 'Result' | cut -d '[' -f 4 | cut -d ']' -f 1 | cut -d "," -f 1`
echo "first number of versions: $FIRST_TRY_TO_SEE_IF_THEY_ARE_DIFFERENT"

NUMBER_OF_VERSIONS=`bundle exec fastlane run google_play_track_version_codes track:internal | grep 'Result' | cut -d '[' -f 4 | cut -d ']' -f 1 | cut -d "," -f 1` 
echo "number of versions: $NUMBER_OF_VERSIONS"
VERSION_COUNT=$((NUMBER_OF_VERSIONS_BUFFER+NUMBER_OF_VERSIONS))
echo "Version count: $VERSION_COUNT"
cd ..
sed -i'' -e "s/0000001/$VERSION_COUNT /g" pubspec.yaml
cat pubspec.yaml
echo "===---===="

GIT_HASH=`git rev-parse --short HEAD`
echo $GIT_HASH
sed -i'' -e "s/<git_hash>/$GIT_HASH/g" lib/app/standard/pages/about/about_page.dart

VERSION=`grep "version:" pubspec.yaml | cut -d ' ' -f 2 | xargs echo `
echo $VERSION
sed -i'' -e "s/<version>/$VERSION/g" lib/app/standard/pages/about/about_page.dart

DATETIME=`date +"%Y-%m-%d %k:%M:%S %Z"`
echo $DATETIME
sed -i'' -e "s/<datetime>/$DATETIME/g" lib/app/standard/pages/about/about_page.dart

cat lib/app/standard/pages/about/about_page.dart
