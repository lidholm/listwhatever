import 'mocha';
import * as functionsTest from 'firebase-functions-test';
import * as sinon from 'sinon';
import * as admin from 'firebase-admin';
import {expect} from 'chai';
import {FeaturesList} from 'firebase-functions-test/lib/features';
const {getFirestore} = require("firebase-admin/firestore");

import * as firestoreUtils from '../src/firestoreUtils';


describe('when signing up for a shared list', () => {
  const docId = 'card-1234';
  let addUserToSharedList;
  let test;

  before(async () => {
    test = require("firebase-functions-test")({
      projectId: 'allmylists-fde43a', //process.env.GCLOUD_PROJECT,
    });
    process.env.GCLOUD_PROJECT = JSON.parse(process.env.FIREBASE_CONFIG).projectId

    addUserToSharedList = (await import('../src/index')).addUserToSharedList;
  });

  afterEach(() => {
    sinon.restore();
  });

  after(async () => {
    test.cleanup();
  });

  it.only('as viewer the userId is added to the list data', async () => {
    const listPath = 'users/otheruser/lists/onelist';
    await getFirestore().doc(listPath).set({
        name: 'List of fun',
        shared: true,
        shareCodeForViewer: 'abc',
        shareCodeForEditor: 'def'
        });

    const sharedPath = '/sharedList/abc';
    await getFirestore().doc(sharedPath).set({
        ownerUserId: 'otheruser',
        ownerListId: 'onelist',
        ownerName: 'Bobby',
        listName: 'List of fun',
        type: 'viewer'

    });

    const viewerPath = '/sharedList/abc/users/firstuser';
    const before = null;
    const after = test.firestore.makeDocumentSnapshot({ id: 'firstuser' }, viewerPath)

    const params = {
      userId: 'firstuser',
      shareCode: 'abc'
    }

    const event = { data: {before: before, after: after}, params: params };

    const wrapped = test.wrap(addUserToSharedList);
    await wrapped(event);


    let snap = await getFirestore().doc(listPath).get();
    expect(snap.data()).to.eql({
      name: 'List of fun',
      shared: true,
      shareCodeForViewer: 'abc',
      shareCodeForEditor: 'def',
      viewers: ['firstuser']
    });



    const sharedListAtUserPath = '/users/firstuser/sharedLists/onelist';
    snap = await getFirestore().doc(sharedListAtUserPath).get();
    expect(snap.data()).to.eql({
      ownerUserId: 'otheruser',
      ownerListId: 'onelist',
      ownerName: 'Bobby',
      listName: 'List of fun',
      path: `users/otheruser/lists/onelist`
    });
  }).timeout(5000);

});
