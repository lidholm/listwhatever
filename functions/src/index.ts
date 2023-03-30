import * as functions from "firebase-functions";

import { db } from "./constants";

exports.createListInListDirectory = functions.firestore
  .document("/users/{userId}/lists/{listId}")
  .onCreate((snap, context) => {
    // Grab the current value of what was written to Firestore.
    const data = snap.data();
    const path = snap.ref.path;
    const shareCode = data.shareCode;
    const userId = context.params.userId;
    const listId = context.params.listId;

    functions.logger.info("path", path);

    functions.logger.info(
      "Setting new list in shareCodes",
      context.params.listId,
      shareCode
    );

    // You must return a Promise when performing asynchronous
    // tasks inside a Functions such as
    // writing to Firestore.
    // Setting an 'uppercase' field in Firestore document returns a Promise.
    return db.doc(`/listIds/${shareCode}/`).create({
      shareCode: shareCode,
      path: path,
      users: [userId],
      userId: userId,
      listId: listId,
    });
  });

exports.deleteListInListDirectory = functions.firestore
  .document("/users/{userId}/lists/{listId}")
  .onDelete((snap, context) => {
    // Grab the current value of what was written to Firestore.
    const data = snap.data();
    const path = snap.ref.path;
    const shareCode = data.shareCode;

    functions.logger.info("path", path);

    functions.logger.info(
      "Deleting list in shareCodes",
      context.params.listId,
      shareCode
    );

    // You must return a Promise when performing asynchronous
    // tasks inside a Functions such as
    // writing to Firestore.
    // Setting an 'uppercase' field in Firestore document returns a Promise.
    return db.doc(`/listIds/${shareCode}/`).delete();
  });
