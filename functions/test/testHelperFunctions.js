const functions = require("firebase-functions");
const admin = require("firebase-admin");

exports.savePublicListItem = functions.firestore
  .document("/users/{userId}/lists/{listId}")
  .onCreate(async (doc, ctx) => {
    functions.logger.info("savePublicListItem");
    const docData = doc.data();
    const userId = ctx.params.userId;
    const listId = ctx.params.listId;

    const firestore = admin.firestore();

    await firestore.doc(`users/${userId}/lists/${listId}`).set(docData);
  });
