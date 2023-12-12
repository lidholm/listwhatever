const { expect } = require("chai");
const admin = require("firebase-admin");

// Initialize the firebase-functions-test SDK using environment variables.
// These variables are automatically set by firebase emulators:exec
//
// This configuration will be used to initialize the Firebase Admin SDK, so
// when we use the Admin SDK in the tests below we can be confident it will
// communicate with the emulators, not production.
const test = require("firebase-functions-test")({
  projectId: process.env.GCLOUD_PROJECT,
});

// Import the exported function definitions from our functions/index.js file
//const myFunctions = require("../index");
//
//describe("Unit tests", () => {
//  after(() => {
//    test.cleanup();
//  });
//
//  it("tests a Cloud Firestore function", async () => {
//    const wrapped = test.wrap(myFunctions.firestoreUppercase);
//
//    // Make a fake document snapshot to pass to the function
//    const after = test.firestore.makeDocumentSnapshot(
//      {
//        text: "hello world",
//      },
//      "/lowercase/foo"
//    );
//
//    // Call the function
//    await wrapped(after);
//
//    // Check the data in the Firestore emulator
//    const snap = await admin.firestore().doc("/uppercase/foo").get();
//    expect(snap.data()).to.eql({
//      text: "HELLO WORLD",
//    });
//  }).timeout(5000);
//
//  it("tests an Auth function that interacts with Firestore", async () => {
//    const wrapped = test.wrap(myFunctions.userSaver);
//
//    // Make a fake user to pass to the function
//    const uid = `${new Date().getTime()}`;
//    const email = `user-${uid}@example.com`;
//    const user = test.auth.makeUserRecord({
//      uid,
//      email,
//    });
//
//    // Call the function
//    await wrapped(user);
//
//    // Check the data was written to the Firestore emulator
//    const snap = await admin.firestore().collection("users").doc(uid).get();
//    const data = snap.data();
//
//    expect(data.uid).to.eql(uid);
//    expect(data.email).to.eql(email);
//  }).timeout(5000);
//});