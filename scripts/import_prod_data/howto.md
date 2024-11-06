# Background

It is usually good to have a quick and easy way to import data from production to either a staging or local database to be able to debug issues.

This documents the process of the latter of those options

## Import production data to emulator database

Since data belongs to a single user (but sometimes shared with others), just copying the entire database isn't a great idea since one would then have to log in as that user in order to see the data.
This explains instead how to either copy the data for a list and then copies the user list data and adds it to a test user, so that the same issue should show up when connecting to the emulator data

## Firebase service account

A pre-requisite step is to make sure to have a service account for Firebase. It can be done by following these steps:

* Visit the [Firebase Console](https://console.firebase.google.com/)
* Select your project
* Navigate to Project Settings (at the time of writing the gear icon button at the top left of the page).
* Navigate to Service Accounts
* Click Generate New Private Key

## Import list data to local json file

First step is to import some data from production to a json file can be done by running   
```
npx -p firestore-export firestore-export --accountCredentials path/to/credentials/file.json --backupFile /backups/myDatabase.json --nodePath collectionA/document1/collectionCC --prettyPrint
```

A more specific example would be    
```
npx -p node-firestore-import-export firestore-export --accountCredentials firebase-deploy-service-account.json --backupFile backupProdDataList.json --nodePath lists/XYZ --prettyPrint
```

This will import only the document for `lists/XYZ` and any subcollections and place it in a file called `backupProdDataList.json`. To note is that that file will contain directly that document and **not** have the full path, e.g. `lists/XYZ`

## Import user list data to local json file

First step is to import some data from production for the user list (i.e. under the `users` collection, and the `lists` subcollection) to a json file can be done by running   

```
npx -p node-firestore-import-export firestore-export --accountCredentials firebase-deploy-service-account.json --backupFile backupProdDataUserList.json --nodePath users/ABC/lists/RST --prettyPrint
```

This will import only the document for `lists/XYZ` and any subcollections and place it in a file called `backupProdDataUserList.json`. To note is that that file will contain directly that document and **not** have the full path, e.g. `/users/ABC/lists/RST`

## Export emulator data to local json file

Next is to export the data from the emulator, so that the production data can be placed inside it and then import it back into the emulator again.
First, make sure that there is a user created and that it has a list created, that makes it easier to know where to copy the data into later

```
FIRESTORE_EMULATOR_HOST=localhost:8080 npx -p node-firestore-import-export firestore-export --backupFile backupEmulatorData.json  --prettyPrint
```

This will export all the data from the emulator to a file.

## Copy production data into emulator data json file

The next step is to make sure that the data from the production file is copied into the emulator data, so that it later can be imported back

First, let's copy the `emulatorExportData.json` to a `emulatorImportData.json` file.

Open all three files (`emulatorImportData.json`, `backupProdDataList.json`, `backupProdDataUserList.json`) in a text editor (e.g. `vscode`).

Now the data from `backupProdDataList.json`, and `backupProdDataUserList.json` should be copied into the right spots in `emulatorImportData.json`.

Let's start with `backupProdDataList.json`. Copy the entire content and find the `lists` collection in `emulatorImportData.json` and add some new data for it `"list123" : <PASTE_DATA_HERE>`.

Now we will do almost the same thing for the user list data.
Open  `backupProdDataUserList` and copy the entire content. Then find the `users/<TEST_USER_ID>/__collections__/lists` collection in `emulatorImportData.json` and add some new data for it `"userList123" : <PASTE_DATA_HERE>`.

The last thing that needs to be done is to update some fields to match what we named them. 

For the data we just pasted, update the following fields:

* `id` needs to be `userList123`
* `listId` needs to be `list123`
* `ownerId` needs to be what was found above for `<TEST_USER_ID>`

For the data under `/lists/list123` we need the following updates:

* `ownerId` needs to be what was found above for `<TEST_USER_ID>`
* `id` needs to be `list123`


## Import data back to emulator

```
FIRESTORE_EMULATOR_HOST=localhost:8080 npx -p node-firestore-import-export firestore-import --backupFile emulatorImportData.json
```