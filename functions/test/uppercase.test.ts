import 'mocha';
import * as functionsTest from 'firebase-functions-test';
import * as sinon from 'sinon';
import * as admin from 'firebase-admin';
import {expect} from 'chai';
import {FeaturesList} from 'firebase-functions-test/lib/features';
const {getFirestore} = require("firebase-admin/firestore");

const {initializeApp} = require("firebase-admin/app");

describe('uppercase', () => {
  const docId = 'card-1234';
  let uppercase;
  let test;

  before(async () => {
    test = require("firebase-functions-test")({
      projectId: 'allmylists-fde43a', //process.env.GCLOUD_PROJECT,
    });
    process.env.GCLOUD_PROJECT = JSON.parse(process.env.FIREBASE_CONFIG).projectId

    uppercase = (await import('../src/index')).upperCase;
  });

  afterEach(() => {   });

  after(async () => {
    test.cleanup();
  });

  it('should write the uppercase version of the original message', async () => {
    const path = '/messages/foo';
    const before = test.firestore.makeDocumentSnapshot({ original: 'something' }, path)
    const after = test.firestore.makeDocumentSnapshot({ original: 'hello world' }, path)

    const params = {
      customerId: '3s2dwWr2QdmmZlze788Z',
      saleId: '62OUh9iqX0BmONfVCohJ'
    }

    const event = { data: {before: before, after: after}, params: params };

    const wrapped = test.wrap(uppercase);
    await wrapped(event);

    const snap = await getFirestore().doc(path).get();
    expect(snap.data()).to.eql({
      uppercase: "HELLO WORLD",
    });
  }).timeout(5000);
});
