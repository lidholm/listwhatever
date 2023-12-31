import 'mocha';
import * as functionsTest from 'firebase-functions-test';
import * as sinon from 'sinon';
import * as admin from 'firebase-admin';
import {expect} from 'chai';
import {FeaturesList} from 'firebase-functions-test/lib/features';
const {getFirestore} = require("firebase-admin/firestore");

import * as stringUtils from '../src/stringUtils';
import * as firestoreUtils from '../src/firestoreUtils';

describe('setShareCodes', () => {
  const docId = 'card-1234';
  let setShareCodes;
  let getUnusedShareCodes;
  let test;

  before(async () => {
    test = require("firebase-functions-test")({
      projectId: 'listanything-2b9b0', //process.env.GCLOUD_PROJECT,
    });
    process.env.GCLOUD_PROJECT = JSON.parse(process.env.FIREBASE_CONFIG).projectId

    setShareCodes = (await import('../src/index')).setShareCodes;
    getUnusedShareCodes = (await import('../src/setSharedCode')).getUnusedShareCodes;
  });

  afterEach(() => {
    sinon.restore();
  });

  after(async () => {
    test.cleanup();
  });

  it('should write the share codes when "shared" flips to true and add to "sharedLists" collection', async () => {
    var randomString = sinon.stub();
    randomString.onCall(0).returns('notit');
    randomString.onCall(1).returns('abcd');
    randomString.onCall(2).returns('efgh');
    sinon.replace(stringUtils, "getRandomString", randomString);

    var existingCodes = sinon.stub();
    existingCodes.onCall(0).returns(true);
    existingCodes.onCall(1).returns(false);
    existingCodes.onCall(2).returns(false);
    sinon.replace(firestoreUtils, "getCodeExists", existingCodes);

    const userPath = '/users/first';
    await getFirestore().doc(userPath).set({ name: 'Alice' });

    const path = '/users/first/lists/foo';
    const before = test.firestore.makeDocumentSnapshot({ name: 'One fancy list' }, path);
    await getFirestore().doc(path).set({ name: 'One fancy list', shared: true });
    const after = test.firestore.makeDocumentSnapshot({ name: 'One fancy list', shared: true }, path)

    const params = {
      userId: 'first',
      listId: 'foo'
    }

    const event = { data: {before: before, after: after}, params: params };

    const wrapped = test.wrap(setShareCodes);
    await wrapped(event);

    let snap = await getFirestore().doc(path).get();
    expect(snap.data()).to.eql({
      name: 'One fancy list',
      shared: true,
      shareCodeForViewer: 'abcd',
      shareCodeForEditor: 'efgh'
    });

    snap = await getFirestore().doc(`sharedLists/abcd`).get();
    expect(snap.data()).to.eql({
      ownerUserId: 'first',
      ownerListId: 'foo',
      ownerName: 'Alice',
      listName: 'One fancy list',
      type: 'viewer'
    });

    snap = await getFirestore().doc(`sharedLists/efgh`).get();
    expect(snap.data()).to.eql({
      ownerUserId: 'first',
      ownerListId: 'foo',
      ownerName: 'Alice',
      listName: 'One fancy list',
      type: 'editor'
    });

  }).timeout(5000);


  it('should not use the same code twice', async () => {
    var randomString = sinon.stub();
    randomString.onCall(0).returns('abc');
    randomString.onCall(1).returns('def');
    randomString.onCall(2).returns('ghi');
    randomString.onCall(3).returns('jkl');

    var existingCodes = sinon.stub();
    existingCodes.onCall(0).returns(true);
    existingCodes.onCall(1).returns(false);
    existingCodes.onCall(2).returns(true);
    existingCodes.onCall(3).returns(false);

    sinon.replace(stringUtils, "getRandomString", randomString);
    sinon.replace(firestoreUtils, "getCodeExists", existingCodes);

    const codes = await getUnusedShareCodes();

    expect(codes).to.eql(['def', 'jkl']);
  }).timeout(5000);
});
