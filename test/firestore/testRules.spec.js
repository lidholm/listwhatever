const { initializeTestEnvironment, assertFails, assertSucceeds } = require('@firebase/rules-unit-testing');

const { readFileSync } = require("fs");


const {  doc,
  getDoc,
  setDoc,
  setLogLevel,
} = require("firebase/firestore");

let testEnv;//: RulesTestEnvironment;

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
});

describe("User", () => {
  it("should be allowed to read their lists", async () => {
    await testEnv.withSecurityRulesDisabled(async (context) => {
      await setDoc(doc(context.firestore(), "users/alice/lists/first"), {
        editors: { alice: true },
      });
    });

    const aliceDb = testEnv.authenticatedContext("alice").firestore();
    await assertSucceeds(getDoc(doc(aliceDb, "users/alice/lists/first")));
//     const bobDb = testEnv.authenticatedContext("bob").firestore();
//     await assertFails(getDoc(doc(bobDb, "users/alice/lists/first")));
  });
});
