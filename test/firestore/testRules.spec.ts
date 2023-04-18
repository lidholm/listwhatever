import { RulesTestEnvironment } from "@firebase/rules-unit-testing";
import { readFileSync } from "fs";

const testing = require("@firebase/rules-unit-testing");
const { initializeTestEnvironment, assertFails, assertSucceeds } = testing;

const {
  doc,
  getDoc,
  setDoc,
  deleteDoc,
  serverTimestamp,
  setLogLevel,
} = require("firebase/firestore");

let testEnv: RulesTestEnvironment;

before(async () => {
  // Silence expected rules rejections from Firestore SDK. Unexpected rejections
  // will still bubble up and will be thrown as an error (failing the tests).
  setLogLevel("error");

  testEnv = await initializeTestEnvironment({
    projectId: "map-my-list",
    firestore: {
      rules: readFileSync("../../firestore.rules", "utf8"),
      host: "0.0.0.0",
      port: 8080,
    },
  });
});

beforeEach(async () => {
  await testEnv.clearFirestore();
});

// describe("Reading user data", () => {
//   it("should not allow users to read from a random collection", async () => {
//     const unauthedDb = testEnv.unauthenticatedContext().firestore();

//     await assertFails(getDoc(doc(unauthedDb, "users/bar")));
//   });

//   it("should allow ONLY signed in users to create their own profile", async () => {
//     const aliceDb = testEnv.authenticatedContext("alice").firestore();

//     await assertSucceeds(
//       setDoc(doc(aliceDb, "users/alice"), {
//         birthday: "January 1",
//         createdAt: serverTimestamp(),
//       })
//     );

//     // Signed in user with required fields for others' profile
//     await assertFails(
//       setDoc(doc(aliceDb, "users/bob"), {
//         birthday: "January 1",
//         createdAt: serverTimestamp(),
//       })
//     );

//     await assertSucceeds(getDoc(doc(aliceDb, "users/alice")));
//     await assertFails(getDoc(doc(aliceDb, "users/bob")));
//   });
// });

describe("User", () => {
  it("should be allowed to read their own list", async () => {
    await testEnv.withSecurityRulesDisabled(async (context) => {
      await setDoc(doc(context.firestore(), "users/alice/lists/first"), {
        editors: { alice: true },
      });
    });

    const aliceDb = testEnv.authenticatedContext("alice").firestore();
    await assertSucceeds(getDoc(doc(aliceDb, "users/alice/lists/first")));
    const bobDb = testEnv.authenticatedContext("bob").firestore();
    await assertFails(getDoc(doc(bobDb, "users/alice/lists/first")));
  });

  it("should be allowed to read list shared with them as viewer", async () => {
    const bobDb = testEnv.authenticatedContext("bob").firestore();
    const charlieDb = testEnv.authenticatedContext("charlie").firestore();
    await assertFails(getDoc(doc(bobDb, "users/alice/lists/first")));

    await testEnv.withSecurityRulesDisabled(async (context) => {
      await setDoc(doc(context.firestore(), "users/alice/lists/first"), {
        viewers: { bob: true },
      });
    });
    await assertSucceeds(getDoc(doc(bobDb, "users/alice/lists/first")));
    await assertFails(getDoc(doc(charlieDb, "users/alice/lists/first")));
  });

  it("should be allowed to read list shared with them as editor", async () => {
    const bobDb = testEnv.authenticatedContext("bob").firestore();
    const charlieDb = testEnv.authenticatedContext("charlie").firestore();
    await assertFails(getDoc(doc(bobDb, "users/alice/lists/first")));

    await testEnv.withSecurityRulesDisabled(async (context) => {
      await setDoc(doc(context.firestore(), "users/alice/lists/first"), {
        editors: { bob: true },
      });
    });
    await assertSucceeds(getDoc(doc(bobDb, "users/alice/lists/first")));
    await assertFails(getDoc(doc(charlieDb, "users/alice/lists/first")));
  });

  it("should be allowed to read list items shared with them as viewer", async () => {
    const bobDb = testEnv.authenticatedContext("bob").firestore();
    const charlieDb = testEnv.authenticatedContext("charlie").firestore();
    await assertFails(
      getDoc(doc(bobDb, "users/alice/lists/first/items/item1"))
    );

    await testEnv.withSecurityRulesDisabled(async (context) => {
      await setDoc(doc(context.firestore(), "users/alice/lists/first"), {
        viewers: { bob: true },
        editors: {},
      });
    });

    await assertSucceeds(
      getDoc(doc(bobDb, "users/alice/lists/first/items/item1"))
    );
    await assertFails(
      getDoc(doc(charlieDb, "users/alice/lists/first/items/item1"))
    );
  });

  it("should only be allowed to delete list if user is owner", async () => {
    const aliceDb = testEnv.authenticatedContext("alice").firestore();
    const bobDb = testEnv.authenticatedContext("bob").firestore();

    await assertFails(getDoc(doc(aliceDb, "users/alice/lists/first")));

    await testEnv.withSecurityRulesDisabled(async (context) => {
      await setDoc(doc(context.firestore(), "users/alice/lists/first"), {
        viewers: { bob: true },
        editors: {},
      });
    });

    await assertSucceeds(deleteDoc(doc(aliceDb, "users/alice/lists/first")));
    await assertFails(deleteDoc(doc(bobDb, "users/alice/lists/first")));
  });

  it("should be allowed to read list items shared with them as editor", async () => {
    const bobDb = testEnv.authenticatedContext("bob").firestore();
    const charlieDb = testEnv.authenticatedContext("charlie").firestore();
    await assertFails(
      getDoc(doc(bobDb, "users/alice/lists/first/items/item1"))
    );

    await testEnv.withSecurityRulesDisabled(async (context) => {
      await setDoc(doc(context.firestore(), "users/alice/lists/first"), {
        viewers: {},
        editors: { bob: true },
      });
    });

    await assertSucceeds(
      getDoc(doc(bobDb, "users/alice/lists/first/items/item1"))
    );
    await assertFails(
      getDoc(doc(charlieDb, "users/alice/lists/first/items/item1"))
    );
  });

  it("should be allowed to write list item if list is shared with them as editor", async () => {
    const bobDb = testEnv.authenticatedContext("bob").firestore();
    const charlieDb = testEnv.authenticatedContext("charlie").firestore();
    await assertFails(
      getDoc(doc(bobDb, "users/alice/lists/first/items/item1"))
    );

    await testEnv.withSecurityRulesDisabled(async (context) => {
      await setDoc(doc(context.firestore(), "users/alice/lists/first"), {
        viewers: {},
        editors: { bob: true },
      });
    });

    await assertSucceeds(
      setDoc(doc(bobDb, "users/alice/lists/first/items/item1"), {
        name: "hello",
      })
    );
    await assertFails(
      setDoc(doc(charlieDb, "users/alice/lists/first/items/item1"), {
        name: "hello",
      })
    );
  });
});
