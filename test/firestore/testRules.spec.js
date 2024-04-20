const { initializeTestEnvironment, assertFails, assertSucceeds } = require('@firebase/rules-unit-testing');

const { readFileSync } = require("fs");

const {
  collection,
  doc,
  addDoc,
  getDoc,
  setDoc,
  updateDoc,
  deleteDoc,
  setLogLevel,
} = require("firebase/firestore");

let testEnv;//: RulesTestEnvironment;
let aliceDb, bobDb, charlieDb, daveDb;

before(async () => {
  // Silence expected rules rejections from Firestore SDK. Unexpected rejections
  // will still bubble up and will be thrown as an error (failing the tests).
  setLogLevel("error");

  testEnv = await initializeTestEnvironment({
    projectId: "fluttertemplate-1e529",
    firestore: {
      rules: readFileSync("../../firestore.rules", "utf8"),
      host: "0.0.0.0",
      port: 8080,
    },
  });
});

beforeEach(async () => {
  await testEnv.clearFirestore();

  aliceDb = testEnv.authenticatedContext("alice").firestore();
  bobDb = testEnv.authenticatedContext("bob").firestore();
  charlieDb = testEnv.authenticatedContext("charlie").firestore();
  daveDb = testEnv.authenticatedContext("dave").firestore();

  await testEnv.withSecurityRulesDisabled(async (context) => {
    await setDoc(doc(context.firestore(), "users/alice"), {
      name: 'ALICE'
    });
  });

  await testEnv.withSecurityRulesDisabled(async (context) => {
    await setDoc(doc(context.firestore(), "users/alice/lists/first"), {
      listName: 'FIRST',
      listId: 'first'
    });
  });

  await testEnv.withSecurityRulesDisabled(async (context) => {
    await setDoc(doc(context.firestore(), "lists/first"), {
      sharedWith: { alice: 'editor', charlie: 'editor', dave: 'viewer' },
      listName: 'FIRST',
      ownerId: 'alice',
    });
  });

  await testEnv.withSecurityRulesDisabled(async (context) => {
    await setDoc(doc(context.firestore(), "lists/first/items/one"), {
      name: 'ONE'
    });
 });
});

describe("User who list is shared with", () => {
  it("should be allowed to read their shared lists", async () => {
    const path = "lists/first";
    await assertSucceeds(getDoc(doc(aliceDb, path)));
    await assertFails(getDoc(doc(bobDb, path)));
    await assertSucceeds(getDoc(doc(charlieDb, path)));
    await assertSucceeds(getDoc(doc(daveDb, path)));
    console.log('DOne');
  });

});
