import * as admin from "firebase-admin";

let projId = "listanything-2b9b0";
let firestore;
let auth;
let app;
export const EMULATOR_HOST = "localhost:8080";

if (process.env.IS_TEST) {
  projId = "sample"; // + new Date().getTime();
  process.env.GCLOUD_PROJECT = projId;
  process.env.FIRESTORE_EMULATOR_HOST = EMULATOR_HOST;
  app = admin.initializeApp({ projectId: projId });
  auth = admin.auth;
  firestore = admin.firestore;
} else {
  app = admin.initializeApp();
  firestore = admin.firestore;
  auth = admin.auth;
}
export const db = admin.firestore();
export const projectId = projId;

// if (process.env.NODE_ENV !== "test") {
// }

module.exports = { db, admin, firestore, auth, app };
