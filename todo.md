
[x] Redirect to correct page after login
[x] List item info view
 - [x] Link from Map view 
[x] Edit for lists
[x] Edit for list items
[x] Center map around filtered list items
 - https://stackoverflow.com/questions/55989773/how-to-zoom-between-two-google-map-markers-in-flutter
 - https://github.com/flutter/flutter/issues/36653
[ ] Share list
[X] Firestore rules
[ ] Create docker containers to be able to test, deploy from local machine
[ ] (Free) Other map than Google maps




        allow get: if (if request.auth != null && request.auth.uid == userId) || (listHasEditor(request.auth.uid) && listHasEditor(request.auth.uid)) || (listHasViewer(request.auth.uid) && listHasEditor(request.auth.uid));
        allow list: if userId == request.auth.uid;
        allow delete, create: if request.auth != null && request.auth.uid == userId;
        allow update: if (if request.auth != null && request.auth.uid == userId) || listHasEditor(request.auth.uid);
