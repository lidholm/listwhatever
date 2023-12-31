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

describe("User", () => {
  it("should be allowed to read their own user data", async () => {
    const path = "users/alice/";
    await assertSucceeds(getDoc(doc(aliceDb, path)));
    await assertFails(getDoc(doc(bobDb, path)));
  });

  it("should be allowed to read their own user lists", async () => {
    const path = "users/alice/lists/first";
    await assertSucceeds(getDoc(doc(aliceDb, path)));
    await assertFails(getDoc(doc(bobDb, path)));
  });

  it("should be allowed to lists where they are a viewer or editor", async () => {
    const path = "lists/first";
    await assertSucceeds(getDoc(doc(aliceDb, path)));
    await assertFails(getDoc(doc(bobDb, path)));
  });

  it("should be allowed to create a list where they are owner", async () => {
    const data = {
                     name: "San Francisco",
                     ownerId: 'alice',
                   };
    await assertSucceeds(addDoc(collection(aliceDb, "lists"), data));
    await assertFails(addDoc(collection(bobDb, "lists"), data));
  });

  it("should be allowed to update a list where they are owner", async () => {
    const data = {
                     name: "San Francisco", state: "CA", country: "USA",
                     capital: false, population: 860000,
                     regions: ["west_coast", "norcal"]
                   };
    await assertSucceeds(setDoc(doc(aliceDb, "lists/first"), data));
    await assertFails(setDoc(doc(bobDb, "lists/first"), data));
  });

  it("should be allowed to read items from their own lists", async () => {
    const path = "lists/first/items/one";
    await assertSucceeds(getDoc(doc(aliceDb, path)));
    await assertFails(getDoc(doc(bobDb, path)));
  });
});

describe("User who list is shared with", () => {
  it("should be allowed to read their shared lists", async () => {
    const path = "lists/first";
    await assertSucceeds(getDoc(doc(aliceDb, path)));
    await assertFails(getDoc(doc(bobDb, path)));
    await assertSucceeds(getDoc(doc(charlieDb, path)));
    await assertSucceeds(getDoc(doc(daveDb, path)));
  });

  it("should be allowed to update their shared lists", async () => {
    const path = "lists/first";
    const updatedDoc = {name: "New name"};
    await assertSucceeds(updateDoc(doc(aliceDb, path), updatedDoc));
    await assertFails(updateDoc(doc(bobDb, path), updatedDoc));
    await assertSucceeds(updateDoc(doc(charlieDb, path), updatedDoc));
    await assertFails(updateDoc(doc(daveDb, path), updatedDoc));
  });

  it("should be NOT be allowed to delete the shared lists, but the item in the shared lists", async () => {
    const path = "lists/first";
    const updatedDoc = {name: "New name"};
    await assertSucceeds(deleteDoc(doc(aliceDb, path)));
    await assertFails(deleteDoc(doc(bobDb, path)));
    await assertFails(deleteDoc(doc(charlieDb, path)));
    await assertFails(deleteDoc(doc(daveDb, path)));
  });

  it("should be allowed to read items from shared lists", async () => {
    const path = "lists/first/items/one";
    await assertSucceeds(getDoc(doc(aliceDb, path)));
    await assertFails(getDoc(doc(bobDb, path)));
    await assertSucceeds(getDoc(doc(charlieDb, path)));
    await assertSucceeds(getDoc(doc(daveDb, path)));
  });

  it("should be allowed to update items from shared lists", async () => {
    const path = "lists/first/items/one";
    const updatedDoc = {name: "New name"};
    await assertSucceeds(updateDoc(doc(aliceDb, path), updatedDoc));
    await assertFails(updateDoc(doc(bobDb, path), updatedDoc));
    await assertSucceeds(updateDoc(doc(charlieDb, path), updatedDoc));
    await assertFails(updateDoc(doc(daveDb, path), updatedDoc));
  });

  it("should be allowed to delete items from shared lists", async () => {
    const path = "lists/first/items/one";
    const updatedDoc = {name: "New name"};
    await assertSucceeds(deleteDoc(doc(aliceDb, path)));
    await assertFails(deleteDoc(doc(bobDb, path)));
    await assertSucceeds(deleteDoc(doc(charlieDb, path)));
    await assertFails(deleteDoc(doc(daveDb, path)));
  });

});
