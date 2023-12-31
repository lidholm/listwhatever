import 'mocha';
import * as functionsTest from 'firebase-functions-test';
import * as sinon from 'sinon';
import * as admin from 'firebase-admin';
import {expect} from 'chai';
import {FeaturesList} from 'firebase-functions-test/lib/features';

describe('(Offline) uppercase', () => {
  let adminInitStub: sinon.SinonStub;
  let firestoreStub: sinon.SinonStub;
  let collectionStub: sinon.SinonStub;
  let docStub: sinon.SinonStub;
  let getStub: sinon.SinonStub;
  let setStub: sinon.SinonStub;
  let updateStub: sinon.SinonStub;
  let oldFirestore: typeof admin.firestore;
  let tester: FeaturesList;
  const docId = 'card-1234';
  let upperCaseV1;

  before(async () => {
    tester = functionsTest();
    oldFirestore = admin.firestore;

    adminInitStub = sinon.stub(admin, 'initializeApp');
    firestoreStub = sinon.stub();
    collectionStub = sinon.stub();
    docStub = sinon.stub();
    getStub = sinon.stub();
    setStub = sinon.stub();
    updateStub = sinon.stub();

    Object.defineProperty(admin, 'firestore', {value: firestoreStub, writable: true});

    firestoreStub.returns({collection: collectionStub});
    collectionStub.withArgs('messages').returns({doc: docStub});
    docStub.returns({get: getStub, set: setStub, update: updateStub});

    upperCaseV1 = (await import('../src/v1-uppercase')).upperCaseV1;
  });

  afterEach(() => {
    adminInitStub.restore();
    firestoreStub.resetHistory();
    collectionStub.resetHistory();
    docStub.resetHistory();
    getStub.resetHistory();
    setStub.resetHistory();
    updateStub.resetHistory();
  });

  after(() => {
    tester.cleanup();
    Object.defineProperty(admin, 'firestore', {value: oldFirestore});
  });


  it('should write the uppercase version of the original message', async () => {
    const change = sinon.stub().returns({
      before: {
        id: docId,
        data: () => ({
          original: 'something else',
        }),
      },
      after: {
        id: docId,
        data: () => ({
          original: 'hello there',
        }),
      },
    });

    getStub.returns(Promise.resolve({exists: false}));

    const wrapped = tester.wrap(upperCaseV1);
    await wrapped(change());

    expect(docStub.calledWith(docId)).to.be.true;
//     expect(getStub.calledOnce).to.be.true;
    expect(setStub.calledOnce).to.be.true;

    sinon.assert.calledWith(setStub, { uppercase: 'HELLO THERE' });

    expect(updateStub.notCalled).to.be.true;
  });

});
