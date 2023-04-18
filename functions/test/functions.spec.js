const { expect } = require("chai");
const admin = require("firebase-admin");

// Initialize the firebase-functions-test SDK using environment variables.
// These variables are automatically set by firebase emulators:exec
//
// This configuration will be used to initialize the Firebase Admin SDK, so
// when we use the Admin SDK in the tests below we can be confident it will
// communicate with the emulators, not production.
const projectName = process.env.GCLOUD_PROJECT
  ? process.env.GCLOUD_PROJECT
  : "fakeproject";
console.log("projectName: ", projectName);
const test = require("firebase-functions-test")({
  projectId: projectName,
});

// Import the exported function definitions from our functions/index.js file
const myFunctions = require("../index");
const testHelperFunctions = require("./testHelperFunctions");

const wrappedCreate = test.wrap(myFunctions.createPublicListId);
const wrappedUpdate = test.wrap(myFunctions.updatePublicListId);
const wrappedDelete = test.wrap(myFunctions.deletePublicListId);

const wrappedSavePublicListItem = test.wrap(
  testHelperFunctions.savePublicListItem
);

const sendPromise = (query, func) =>
  new Promise((resolve) => {
    const req = { query: query };
    // A fake response object, with a stubbed send() function which asserts that it is called
    // with the right result
    const res = {
      send: (text) => {
        resolve(text);
      },
    };

    // Invoke function with our fake request and response objects.
    func(req, res);
  });

describe("publicListId", () => {
  it("will be created, updated, and deleted when matching list is created, updated, and deleted", async () => {
    console.log(
      "will be created, updated, and deleted when matching list is created, updated, and deleted"
    );
    const listPath = "users/alice/lists/firstList";
    const createData = test.firestore.makeDocumentSnapshot(
      {
        name: "First list",
        publicListId: "abc123def",
        userId: "alice",
        shareCodeForViewer: "qwerty123",
        shareCodeForEditor: "ytrewq321",
        viewers: {},
        editors: { alice: true },
      },
      listPath
    );

    // Call the function
    await wrappedCreate(createData, {
      params: { userId: "alice", listId: "firstList" },
    });

    // Check the data in the Firestore emulator
    const snapWrite = await admin
      .firestore()
      .doc("/publicListIds/abc123def")
      .get();
    const expectedPublicList = {
      publicListId: "abc123def",
      path: "users/alice/lists/firstList",
      userId: "alice",
      listId: "firstList",
      viewers: {},
      editors: { alice: true },
      shareCodeForViewer: "qwerty123",
      shareCodeForEditor: "ytrewq321",
    };
    expect(snapWrite.data()).to.eql(expectedPublicList);

    // Call the update function
    const beforeData = test.firestore.makeDocumentSnapshot(
      { foo: "bar" },
      listPath
    );
    const afterData = test.firestore.makeDocumentSnapshot(
      {
        name: "First list",
        publicListId: "abc123def",
        userId: "alice",
        shareCodeForViewer: "xcv",
        shareCodeForEditor: "bnm",
        viewers: { bob: true },
        editors: { alice: true },
      },
      listPath
    );
    const updateData = test.makeChange(beforeData, afterData);

    await wrappedUpdate(updateData, {
      params: { userId: "alice", listId: "firstList" },
    });

    // Check the data in the Firestore emulator
    const snapUpdate = await admin
      .firestore()
      .doc("/publicListIds/abc123def")
      .get();
    const expectedUpdatedPublicList = {
      listId: "firstList",
      path: "users/alice/lists/firstList",
      publicListId: "abc123def",
      userId: "alice",
      viewers: { bob: true },
      editors: { alice: true },
      shareCodeForViewer: "xcv",
      shareCodeForEditor: "bnm",
    };
    expect(snapUpdate.data()).to.eql(expectedUpdatedPublicList);

    const deleteData = test.firestore.makeDocumentSnapshot(
      {
        name: "First list",
        publicListId: "abc123def",
        userId: "alice",
        shareCodeForViewer: "xcv",
        shareCodeForEditor: "bnm",
        viewers: { bob: true },
        editors: { alice: true },
      },
      listPath
    );
    await wrappedDelete(deleteData, {
      params: { userId: "alice", listId: "firstList" },
    });
    const snapDelete = await admin
      .firestore()
      .doc("/publicListIds/abc123def")
      .get();
    const expectedDeletedPublicList = {
      listId: "firstList",
      path: "users/alice/lists/firstList",
      publicListId: "abc123def",
      userId: "alice",
      viewers: { bob: true },
      editors: { alice: true },
      shareCodeForViewer: "xcv",
      shareCodeForEditor: "bnm",
    };
    expect(snapDelete.data()).to.eql(undefined);
  }).timeout(5000);
});

describe("Test addUserToSharedList", () => {
  it("User is added to editor list when shareCode matches editor code", async () => {
    const listPath = "users/alice/lists/firstList";
    const createData = test.firestore.makeDocumentSnapshot(
      {
        name: "First list",
        publicListId: "public123",
        userId: "alice",
        shareCodeForViewer: "qwerty123",
        shareCodeForEditor: "ytrewq321",
        viewers: { other: true },
        editors: { alice: true },
      },
      listPath
    );

    await wrappedCreate(createData, {
      params: { userId: "alice", listId: "firstList" },
    });
    // Looks like it's needed to have a helper function that save to the database
    // and not just the wrappedCreate and documentSnapshot
    wrappedSavePublicListItem(createData, {
      params: { userId: "alice", listId: "firstList" },
    });

    // Wait for the promise to be resolved and then check the sent text
    const text = await sendPromise(
      { userId: "bobby", publicListId: "public123", shareCode: "qwerty123" },
      myFunctions.addUserToSharedList
    );
    expect(text).to.eq(`Added user to shared list.`);

    // Check the data in the Firestore emulator
    const snap = await admin
      .firestore()
      .doc("users/alice/lists/firstList")
      .get();
    const expectedPublicList = {
      name: "First list",
      publicListId: "public123",
      userId: "alice",
      shareCodeForViewer: "qwerty123",
      shareCodeForEditor: "ytrewq321",
      viewers: { other: true, bobby: true },
      editors: { alice: true },
    };
    expect(snap.data()).to.eql(expectedPublicList);
  }).timeout(5000);

  it("User is added to viewer list when shareCode matches viewer code", async () => {
    const listPath = "users/alice/lists/firstList";
    const createData = test.firestore.makeDocumentSnapshot(
      {
        name: "First list",
        publicListId: "public123",
        userId: "alice",
        shareCodeForViewer: "qwerty123",
        shareCodeForEditor: "ytrewq321",
        viewers: { other: true },
        editors: { alice: true },
      },
      listPath
    );

    await wrappedCreate(createData, {
      params: { userId: "alice", listId: "firstList" },
    });
    // Looks like it's needed to have a helper function that save to the database
    // and not just the wrappedCreate and documentSnapshot
    wrappedSavePublicListItem(createData, {
      params: { userId: "alice", listId: "firstList" },
    });

    // Wait for the promise to be resolved and then check the sent text
    const text = await sendPromise(
      { userId: "bobby", publicListId: "public123", shareCode: "ytrewq321" },
      myFunctions.addUserToSharedList
    );
    expect(text).to.eq(`Added user to shared list.`);

    // Check the data in the Firestore emulator
    const snap = await admin
      .firestore()
      .doc("users/alice/lists/firstList")
      .get();
    const expectedPublicList = {
      name: "First list",
      publicListId: "public123",
      userId: "alice",
      shareCodeForViewer: "qwerty123",
      shareCodeForEditor: "ytrewq321",
      viewers: { other: true },
      editors: { alice: true, bobby: true },
    };
    expect(snap.data()).to.eql(expectedPublicList);
  }).timeout(5000);

  it("User is not added again if already added", async () => {
    const listPath = "users/alice/lists/firstList";
    const createData = test.firestore.makeDocumentSnapshot(
      {
        name: "First list",
        publicListId: "public123",
        userId: "alice",
        shareCodeForViewer: "qwerty123",
        shareCodeForEditor: "ytrewq321",
        viewers: { other: true, bobby: true },
        editors: { alice: true },
      },
      listPath
    );

    await wrappedCreate(createData, {
      params: { userId: "alice", listId: "firstList" },
    });
    // Looks like it's needed to have a helper function that save to the database
    // and not just the wrappedCreate and documentSnapshot
    wrappedSavePublicListItem(createData, {
      params: { userId: "alice", listId: "firstList" },
    });

    // Wait for the promise to be resolved and then check the sent text
    const text = await sendPromise(
      { userId: "bobby", publicListId: "public123", shareCode: "qwerty123" },
      myFunctions.addUserToSharedList
    );
    expect(text).to.eq(`Added user to shared list.`);

    // Check the data in the Firestore emulator
    const snap = await admin
      .firestore()
      .doc("users/alice/lists/firstList")
      .get();
    const expectedPublicList = {
      name: "First list",
      publicListId: "public123",
      userId: "alice",
      shareCodeForViewer: "qwerty123",
      shareCodeForEditor: "ytrewq321",
      viewers: { other: true, bobby: true },
      editors: { alice: true },
    };
    expect(snap.data()).to.eql(expectedPublicList);
  }).timeout(5000);

  it(" User is NOT added when share code doesn't match", async () => {
    const listPath = "users/alice/lists/firstList";
    const createData = test.firestore.makeDocumentSnapshot(
      {
        name: "First list",
        publicListId: "public123",
        userId: "alice",
        shareCodeForViewer: "qwerty123",
        shareCodeForEditor: "ytrewq321",
        viewers: { other: true },
        editors: { alice: true },
      },
      listPath
    );

    await wrappedCreate(createData, {
      params: { userId: "alice", listId: "firstList" },
    });
    // Looks like it's needed to have a helper function that save to the database
    // and not just the wrappedCreate and documentSnapshot
    wrappedSavePublicListItem(createData, {
      params: { userId: "alice", listId: "firstList" },
    });

    // Wait for the promise to be resolved and then check the sent text
    const text = await sendPromise(
      { userId: "bobby", publicListId: "public123", shareCode: "notmatching" },
      myFunctions.addUserToSharedList
    );
    expect(text).to.eq(`Share code is not matching.`);

    // Check the data in the Firestore emulator
    const snap = await admin
      .firestore()
      .doc("users/alice/lists/firstList")
      .get();
    const expectedPublicList = {
      name: "First list",
      publicListId: "public123",
      userId: "alice",
      shareCodeForViewer: "qwerty123",
      shareCodeForEditor: "ytrewq321",
      viewers: { other: true },
      editors: { alice: true },
    };
    expect(snap.data()).to.eql(expectedPublicList);
  }).timeout(5000);

  it(" User is NOT added when userId doesn't exist", async () => {
    // TODO: Implement
    const date = new Date();
    const compareDate = new Date(2023, 4, 10);
    console.log(`current date: ${date}`);
    console.log(`compare date: ${compareDate}`);
    expect(date).to.be.lessThan(compareDate);
  });

  it(" User is NOT added when publicListId doesn't exist", async () => {
    const listPath = "users/alice/lists/firstList";
    const createData = test.firestore.makeDocumentSnapshot(
      {
        name: "First list",
        publicListId: "public123",
        userId: "alice",
        shareCodeForViewer: "qwerty123",
        shareCodeForEditor: "ytrewq321",
        viewers: { other: true },
        editors: { alice: true },
      },
      listPath
    );

    await wrappedCreate(createData, {
      params: { userId: "alice", listId: "firstList" },
    });
    // Looks like it's needed to have a helper function that save to the database
    // and not just the wrappedCreate and documentSnapshot
    wrappedSavePublicListItem(createData, {
      params: { userId: "alice", listId: "firstList" },
    });

    // Wait for the promise to be resolved and then check the sent text
    const text = await sendPromise(
      {
        userId: "bobby",
        publicListId: "wrongPublicListId",
        shareCode: "qwerty123",
      },
      myFunctions.addUserToSharedList
    );
    expect(text).to.eq("Didn't recognize the publicListId.");

    // Check the data in the Firestore emulator
    const snap = await admin
      .firestore()
      .doc("users/alice/lists/firstList")
      .get();
    const expectedPublicList = {
      name: "First list",
      publicListId: "public123",
      userId: "alice",
      shareCodeForViewer: "qwerty123",
      shareCodeForEditor: "ytrewq321",
      viewers: { other: true },
      editors: { alice: true },
    };
    expect(snap.data()).to.eql(expectedPublicList);
  });

  it("add lists to 'participatedLists'", async () => {
    const listPath = "users/alice/lists/firstList";
    const createData = test.firestore.makeDocumentSnapshot(
      {
        name: "First list",
        publicListId: "public123",
        userId: "alice",
        shareCodeForViewer: "qwerty123",
        shareCodeForEditor: "ytrewq321",
        viewers: { bobby: true },
        editors: { alice: true },
      },
      listPath
    );

    const updateData = test.makeChange(createData, createData);

    await wrappedCreate(createData, {
      params: { userId: "alice", listId: "firstList" },
    });
    await wrappedUpdate(updateData, {
      params: { userId: "alice", listId: "firstList" },
    });

    // Check the data in the Firestore emulator
    const snap = await admin
      .firestore()
      .doc("users/bobby/participatedLists/firstList")
      .get();
    const expectedPublicList = {
      name: "First list",
      publicListId: "public123",
      userId: "alice",
      shareCodeForViewer: "qwerty123",
      shareCodeForEditor: "ytrewq321",
      viewers: { bobby: true },
      editors: { alice: true },
    };
    expect(snap.data()).to.eql(expectedPublicList);
  }).timeout(5000);
});

describe("'participatedLists'", () => {
  it("are updated when original list is updated", async () => {
    const listPath = "users/alice/lists/firstList";
    const createData = test.firestore.makeDocumentSnapshot(
      {
        name: "First list",
        publicListId: "public123",
        userId: "alice",
        shareCodeForViewer: "qwerty123",
        shareCodeForEditor: "ytrewq321",
        viewers: { bobby: true },
        editors: { alice: true },
      },
      listPath
    );

    // Call the function
    await wrappedCreate(createData, {
      params: { userId: "alice", listId: "firstList" },
    });

    const after = test.firestore.makeDocumentSnapshot(
      {
        name: "First list",
        publicListId: "public123",
        userId: "alice",
        shareCodeForViewer: "qwerty123",
        shareCodeForEditor: "ytrewq321",
        viewers: { bobby: true, charlie: true, dean: true },
        editors: { alice: true },
      },
      listPath
    );
    const updateData = test.makeChange(createData, after);

    await wrappedUpdate(updateData, {
      params: { userId: "alice", listId: "firstList" },
    });

    // Check the data in the Firestore emulator
    const snapBobby = await admin
      .firestore()
      .doc("users/bobby/participatedLists/firstList")
      .get();
    const expectedParticipaterListForBobby = {
      name: "First list",
      publicListId: "public123",
      userId: "alice",
      shareCodeForViewer: "qwerty123",
      shareCodeForEditor: "ytrewq321",
      viewers: { bobby: true, charlie: true, dean: true },
      editors: { alice: true },
    };
    expect(snapBobby.data()).to.eql(expectedParticipaterListForBobby);

    const snapCharlie = await admin
      .firestore()
      .doc("users/charlie/participatedLists/firstList")
      .get();
    const expectedParticipaterListForCharlie = {
      name: "First list",
      publicListId: "public123",
      userId: "alice",
      shareCodeForViewer: "qwerty123",
      shareCodeForEditor: "ytrewq321",
      viewers: { bobby: true, charlie: true, dean: true },
      editors: { alice: true },
    };
    expect(snapCharlie.data()).to.eql(expectedParticipaterListForCharlie);
  }).timeout(5000);

  it("are deleted when original list is deleted", async () => {
    const listPath = "users/alice/lists/firstList";
    const createData = test.firestore.makeDocumentSnapshot(
      {
        name: "First list",
        publicListId: "public123",
        userId: "alice",
        shareCodeForViewer: "qwerty123",
        shareCodeForEditor: "ytrewq321",
        viewers: { bobby: true, charlie: true },
        editors: { alice: true },
      },
      listPath
    );

    // Call the function
    await wrappedCreate(createData, {
      params: { userId: "alice", listId: "firstList" },
    });

    const after = test.firestore.makeDocumentSnapshot(
      {
        name: "Updated list",
        publicListId: "public123",
        userId: "alice",
        shareCodeForViewer: "qwerty123",
        shareCodeForEditor: "ytrewq321",
        viewers: { bobby: true, charlie: true },
        editors: { alice: true },
      },
      listPath
    );
    const updateData = test.makeChange(createData, after);

    await wrappedUpdate(updateData, {
      params: { userId: "alice", listId: "firstList" },
    });

    // Check the data in the Firestore emulator
    const updateSnapBobby = await admin
      .firestore()
      .doc("users/bobby/participatedLists/firstList")
      .get();
    expect(updateSnapBobby.data()).to.not.eql(undefined);

    // Check the data in the Firestore emulator
    const updateSnapCharlie = await admin
      .firestore()
      .doc("users/charlie/participatedLists/firstList")
      .get();
    expect(updateSnapBobby.data()).to.not.eql(undefined);

    await wrappedDelete(createData, {
      params: { userId: "alice", listId: "firstList" },
    });

    // Check the data in the Firestore emulator
    const deleteSnapBobby = await admin
      .firestore()
      .doc("users/bobby/participatedLists/firstList")
      .get();
    expect(deleteSnapBobby.data()).to.eql(undefined);

    // Check the data in the Firestore emulator
    const deleteSnapCharlie = await admin
      .firestore()
      .doc("users/bobby/participatedLists/firstList")
      .get();
    expect(deleteSnapCharlie.data()).to.eql(undefined);
  }).timeout(5000);

  it("are deleted when user is removed from viewer/editor", async () => {
    const listPath = "users/alice/lists/firstList";
    const createData = test.firestore.makeDocumentSnapshot(
      {
        name: "First list",
        publicListId: "public123",
        userId: "alice",
        shareCodeForViewer: "qwerty123",
        shareCodeForEditor: "ytrewq321",
        viewers: { bobby: true },
        editors: { alice: true },
      },
      listPath
    );

    // Call the function
    await wrappedCreate(createData, {
      params: { userId: "alice", listId: "firstList" },
    });

    const firstChange = test.firestore.makeDocumentSnapshot(
      {
        name: "First list",
        publicListId: "public123",
        userId: "alice",
        shareCodeForViewer: "qwerty123",
        shareCodeForEditor: "ytrewq321",
        viewers: { bobby: true, charlie: true },
        editors: { alice: true },
      },
      listPath
    );
    const firstUpdateData = test.makeChange(createData, firstChange);

    await wrappedUpdate(firstUpdateData, {
      params: { userId: "alice", listId: "firstList" },
    });

    // Check the data in the Firestore emulator
    const firstSnapBobby = await admin
      .firestore()
      .doc("users/bobby/participatedLists/firstList")
      .get();
    const firstExpectedParticipaterListForBobby = {
      name: "First list",
      publicListId: "public123",
      userId: "alice",
      shareCodeForViewer: "qwerty123",
      shareCodeForEditor: "ytrewq321",
      viewers: { bobby: true, charlie: true },
      editors: { alice: true },
    };
    expect(firstSnapBobby.data()).to.eql(firstExpectedParticipaterListForBobby);

    const removeBobyChange = test.firestore.makeDocumentSnapshot(
      {
        name: "First list",
        publicListId: "public123",
        userId: "alice",
        shareCodeForViewer: "qwerty123",
        shareCodeForEditor: "ytrewq321",
        viewers: { charlie: true },
        editors: { alice: true },
      },
      listPath
    );
    const removeBobbyUpdateData = test.makeChange(
      firstChange,
      removeBobyChange
    );

    await wrappedUpdate(removeBobbyUpdateData, {
      params: { userId: "alice", listId: "firstList" },
    });

    // Check the data in the Firestore emulator
    const removeBobbySnap = await admin
      .firestore()
      .doc("users/bobby/participatedLists/firstList")
      .get();

    expect(removeBobbySnap.data()).to.eql(undefined);
  });
});
