# Deploy from local machine 

! This is not necessarily recommended, but can be good for debugging or speeding up deployment

## Flutter setup

`flutter pub get`  
`dart run build_runner build --delete-conflicting-outputs`
`flutter gen-l10n`

## Decrypt sops

`cat key.txt`
`$SOPS_AGE_KEY="XXXXXXX" sh scripts/gitlabci/decryptSops.sh`  
`source .prod.env`  

## Replace `About` page

`sh scripts/gitlabci/replaceAboutScreen.sh`

## Lint and tests

`flutter analyze`  
`flutter test -r expanded`  
In `tests/firestore`, run `./node_modules/.bin/firebase emulators:exec --only firestore "./runtest.sh"`
In `functions`, run `./node_modules/.bin/firebase emulators:exec --only firestore --project=fakeproject "./runtest.sh"`
`sh scripts/gitlabci/buildIntegrationTestApk.sh`
`sh scripts/gitlabci/runIntegrationTest.sh`

## Build 

### Android

#### .aab

`flutter build appbundle --release --flavor production -t lib/standard/main/main_production.dart`

#### .apk

`flutter build apk --target lib/standard/main/main_production.dart --flavor production`

### Web

`flutter build web --release -t lib/standard/main/main_production.dart`

### iOS

## Deploy

### Rules and functions


`export GOOGLE_APPLICATION_CREDENTIALS=/builds/lidholm/listanything/firebase-deploy-service-account.json`  
`firebase use listanything-2b9b0`  
`firebase deploy --only firestore:rules`
`firebase deploy --only functions`

### Android To Google Play

`sh scripts/gitlabci/deployToGooglePlayStore.sh`

### Android to Firebase 

`APP_ID=\`grep mobilesdk_app_id android/app/google-services.json | head -1 | cut -d '"' -f 4\` `
`export GOOGLE_APPLICATION_CREDENTIALS=/builds/lidholm/listanything/firebase-deploy-service-account.json`  
`/firebase appdistribution:distribute app-production-release.aab --app $APP_ID  --testers-file deploy/android/testers.txt --release-notes-file "deploy/release_notes.txt"`  

### Hosting 

`export GOOGLE_APPLICATION_CREDENTIALS=/builds/lidholm/listanything/firebase-deploy-service-account.json`  
`firebase use listanything-2b9b0`  
`firebase deploy --only hosting`  

