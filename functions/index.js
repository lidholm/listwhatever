const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

/**
 * Auth-triggered function which writes a user document to Firestore.
 */
exports.userSaver = functions.auth.user().onCreate(async (user, ctx) => {
  const firestore = admin.firestore();

  // Make a document in the user's collection with everything we know about the user
  const userId = user.uid;
  const userRef = firestore.collection("autousers").doc(userId);
  await userRef.set(user.toJSON());
});

exports.createPublicListId = functions.firestore
  .document("/users/{userId}/lists/{listId}")
  .onCreate(async (doc, ctx) => {
    // functions.logger.info("createPublicListId");
    const path = doc.ref.path;
    const docData = doc.data();
    const publicListId = docData.publicListId;
    const userId = ctx.params.userId;
    const listId = ctx.params.listId;

    const firestore = admin.firestore();
    const publicListItem = {
      listId: listId,
      path: path,
      viewers: docData.viewers,
      shareCodeForViewer: docData.shareCodeForViewer,
      shareCodeForEditor: docData.shareCodeForEditor,
      userId: userId,
      publicListId: publicListId,
      editors: docData.editors,
    };
    await firestore
      .collection("publicListIds")
      .doc(publicListId)
      .set(publicListItem);
  });

exports.updatePublicListId = functions.firestore
  .document("/users/{userId}/lists/{listId}")
  .onUpdate(async (change, context) => {
    functions.logger.info("updatePublicListId");
    const listId = context.params.listId;
    const before = change.before;
    const after = change.after;
    // functions.logger.info("after: ", after);

    const beforeData = before.data();
    const data = after.data();
    const publicListId = data.publicListId;
    functions.logger.info("data: ", data);

    const firestore = admin.firestore();

    for (const user of sharerUsers(beforeData)) {
      functions.logger.info(`viewer/editor: ${user}`);
      if (user != data.userId) {
        const participaterPath = `users/${user}/participatedLists/${listId}`;
        functions.logger.info("before participaterPath: ", participaterPath);
        writeResult = await firestore.doc(participaterPath).delete();
      }
    }

    functions.logger.info("viewers: ", data.viewers);
    functions.logger.info("editors: ", data.editors);
    for (const user of sharerUsers(data)) {
      functions.logger.info(`viewer/editor: ${user}`);
      if (user != data.userId) {
        const participaterPath = `users/${user}/participatedLists/${listId}`;
        functions.logger.info("participaterPath: ", participaterPath);
        writeResult = await firestore.doc(participaterPath).set(data);
      }
    }

    return firestore.doc(`/publicListIds/${publicListId}/`).update({
      viewers: data.viewers,
      editors: data.editors,
      shareCodeForEditor: data.shareCodeForEditor,
      shareCodeForViewer: data.shareCodeForViewer,
    });
  });

exports.deletePublicListId = functions.firestore
  .document("/users/{userId}/lists/{listId}")
  .onDelete(async (snap, context) => {
    functions.logger.info("deletePublicListId");
    // Grab the current value of what was written to Firestore.
    const data = snap.data();
    const publicListId = data.publicListId;
    const listId = context.params.listId;

    const firestore = admin.firestore();

    for (const viewer of sharerUsers(data)) {
      functions.logger.info(`viewer: ${viewer}`);
      const participaterPath = `users/${viewer}/participatedLists/${listId}`;
      functions.logger.info("participaterPath: ", participaterPath);
      writeResult = await firestore.doc(participaterPath).delete();
    }

    return firestore.doc(`/publicListIds/${publicListId}/`).delete();
  });

// http://127.0.0.1:5001/listanything-2b9b0/us-central1/addUserToSharedList?userId=someuser&publicListId=anid&shareCode=theCode
exports.addUserToSharedList = functions.https.onRequest(
  async (request, response) => {
    functions.logger.info("addUserToSharedList");

    const userId = request.query.userId;
    const publicListId = request.query.publicListId;
    const shareCode = request.query.shareCode;

    functions.logger.info("userId", userId);
    functions.logger.info("publicListId", publicListId);
    functions.logger.info("shareCode", shareCode);

    const firestore = admin.firestore();

    const path = `publicListIds/${publicListId}`;
    functions.logger.info("path: ", path);
    const publicListRef = await firestore.doc(path).get();
    const publicListItem = publicListRef.data();

    functions.logger.info("publicListItem", publicListItem);
    if (publicListItem == undefined) {
      functions.logger.info("Didn't recognize the publicListId.");
      response.send("Didn't recognize the publicListId.");
      return;
    }

    let writeResult = null;
    const listPath = publicListItem.path;
    functions.logger.info("listPath", listPath);

    const listRef = await firestore.doc(listPath).get();
    const list = listRef.data();
    functions.logger.info("list", list);

    if (
      publicListItem.shareCodeForViewer != shareCode &&
      publicListItem.shareCodeForEditor != shareCode
    ) {
      functions.logger.info(
        "Share code is not matching either viewers or editors."
      );
      response.send("Share code is not matching.");
      return;
    }
    if (publicListItem.shareCodeForViewer == shareCode) {
      functions.logger.info("Writing viewers");
      list.viewers[userId] = true;
    } else if (publicListItem.shareCodeForEditor == shareCode) {
      functions.logger.info("Writing editors");
      list.editors[userId] = true;
    }
    functions.logger.info("list", list);
    functions.logger.info("listPath", listPath);
    writeResult = await firestore.doc(listPath).set(list);
    if (writeResult == null) {
      response.send("Share code is not matching");
    } else {
      // Send back a message that we've successfully written the message
      response.send("Added user to shared list.");
    }
  }
);

const sharerUsers = (data) => {
  functions.logger.info("sharerUsers.data:", data);
  return [
    ...(data.viewers != null ? Object.keys(data.viewers) : []),
    ...(data.editors != null ? Object.keys(data.editors) : []),
  ];
};
