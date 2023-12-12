
for packageDir in $(ls packages)
do
  echo $packageDir
  cd packages/$packageDir
  [ -d "test" ] &&flutter test
  cd ../..
done