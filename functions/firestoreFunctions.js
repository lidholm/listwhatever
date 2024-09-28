// firestoreFunctions.js
const {onDocumentCreated} = require("firebase-functions/v2/firestore");
const logger = require("firebase-functions/logger");

exports.onDocumentCreatedFunction = onDocumentCreated("/messages/{documentId}", (event) => {
    const original = event.data.data().original;
    logger.log("Uppercasing", event.params.documentId, original);
  
    const uppercase = original.toUpperCase() + ' - 2';
  
    return event.data.ref.set({uppercase}, {merge: true});
});