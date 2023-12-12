/**
 * Import function triggers from their respective submodules:
 *
 * const {onCall} = require("firebase-functions/v2/https");
 * const {onDocumentWritten} = require("firebase-functions/v2/firestore");
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

const logger = require("firebase-functions/logger");
const {onRequest} = require("firebase-functions/v2/https");
const {onDocumentCreated, onDocumentWritten} = require("firebase-functions/v2/firestore");

// The Firebase Admin SDK to access Firestore.
const {initializeApp} = require("firebase-admin/app");
const {getFirestore} = require("firebase-admin/firestore");

initializeApp();

// Create and deploy your first functions
// https://firebase.google.com/docs/functions/get-started

// exports.helloWorld = onRequest((request, response) => {
//   logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });

//
//exports.shareListItem = onDocumentWritten("/users/{userId}/lists/{listId}/items/{listItemId}", (event) => {
//  logger.log(event.data.after.data());
//
//  const userId = event.params.userId;
//  const listId = event.params.listId;
//  const listItemId = event.params.listItemId;
//
//  if (event.data.after.data() == undefined) {
//    deleteSharedListItem(userId, listId, listItemId, event.data.before.data());
//  } else {
//    copySharedListItem(userId, listId, listItemId, event.data.after.data());
//  }
//  return true;
//});
//
//
//
//async function copySharedListItem(userId, listId, listItemId, listItemData)  {
//  logger.log("userId", userId);
//  logger.log("listId", listId);
//  logger.log("listItemId", listItemId);
//  logger.log("listItemData", listItemData);
//
//  const listPath = `/users/${userId}/lists/${listId}`;
//  logger.log("listPath", listPath);
//
//  const listData = (await getFirestore().doc(listPath).get()).data();
//  if (listData == undefined) {
//    logger.error('listData == undefined. Should NOT happen');
//    return;
//  }
//  logger.log("listData", listData);
//
//  if (listData['shared'] == undefined || listData['shared'] == false) {
//    logger.log('not shared');
//    return;
//  }
//
//  const latestUpdateUser = listItemData['latestUpdateUser'];
//  logger.log(`latestUpdateUser: ${latestUpdateUser}`);
//  if (latestUpdateUser == undefined) {
//    logger.error("'latestUpdateUser' should be set");
//    return;
//  }
//  if (latestUpdateUser != userId) {
//    logger.log('latestUpdateUser != userId');
//    return;
//  }
//
//  const sharedWith = (listData['viewers'] ?? []).concat((listData['editors'] ?? []));
//  logger.log("sharedWith", sharedWith);
//
//  for (const sharedWithUserId of sharedWith) {
//    if (sharedWithUserId == userId) {
//      continue;
//    }
//
//    const path = `/users/${sharedWithUserId}/lists/${listId}/items/${listItemId}`;
//    logger.log("path", path);
//    await getFirestore().doc(path).set(listItemData);
//  }
//}
//
//async function deleteSharedListItem(userId, listId, listItemId, listItemData) {
//  logger.log("userId", userId);
//  logger.log("listId", listId);
//  logger.log("listItemId", listItemId);
//  logger.log("listItemData", listItemData);
//
//  const listPath = `/users/${userId}/lists/${listId}`;
//  logger.log("listPath", listPath);
//
//  const listData = (await getFirestore().doc(listPath).get()).data();
//  if (listData == undefined) {
//    logger.error('listData == undefined. Should NOT happen');
//    return;
//  }
//  logger.log("listData", listData);
//
//  if (listData['shared'] == undefined || listData['shared'] == false) {
//    logger.log('not shared');
//    return;
//  }
//
//  const latestUpdateUser = listItemData['latestUpdateUser'];
//  logger.log(`latestUpdateUser: ${latestUpdateUser}`);
//  if (latestUpdateUser == undefined) {
//    logger.error("'latestUpdateUser' should be set");
//    return;
//  }
//  if (latestUpdateUser != userId) {
//    logger.log('latestUpdateUser != userId');
//    return;
//  }
//
//  const sharedWith = (listData['viewers'] ?? []).concat((listData['editors'] ?? []));
//  logger.log("sharedWith", sharedWith);
//
//  for (const sharedWithUserId of sharedWith) {
//    if (sharedWithUserId == userId) {
//      continue;
//    }
//
//    const path = `/users/${sharedWithUserId}/lists/${listId}/items/${listItemId}`;
//    logger.log("path", path);
//    await getFirestore().doc(path).delete();
//  }
//}
//
//
//// Listens for new messages added to /messages/:documentId/original
//// and saves an uppercased version of the message
//// to /messages/:documentId/uppercase
//exports.makeuppercase = onDocumentCreated("/messages/{documentId}", async (event) => {
//  // Grab the current value of what was written to Firestore.
//  const original = event.data.data().original;
//
//    await getFirestore().doc('/messages/hello').set({name:'cat'});
//  // Access the parameter `{documentId}` with `event.params`
//  logger.log("event", event);
//  logger.log("event.params", event.params);
//  const uppercase = original.toUpperCase();
//
//  // You must return a Promise when performing
//  // asynchronous tasks inside a function
//  // such as writing to Firestore.
//  // Setting an 'uppercase' field in Firestore document returns a Promise.
//  return event.data.ref.set({uppercase}, {merge: true});
//});
//
