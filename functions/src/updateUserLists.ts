
import {onDocumentWritten} from 'firebase-functions/v2/firestore';
import {getFirestore} from 'firebase-admin/firestore';
import * as logger from 'firebase-functions/logger';

import * as firestoreUtils from './firestoreUtils';


export const updateUserLists = onDocumentWritten('/lists/{listId}', async (event: any): Promise<void> => {
  const listId = event.params.listId;

  const listPath = `/lists/${listId}`;
  const docRef = getFirestore().doc(listPath);
  const listInfo = (await docRef.get()).data();
  if (listInfo == undefined) {
    logger.log('Could not get data from list');
    return;
  }
  logger.log(`listInfo: ${JSON.stringify(listInfo)}`);

  const userListIds = [listInfo.ownerId as string].concat(Object.keys(listInfo.sharedWith));

  for (const userListId of userListIds) {
    logger.log(`userListId: ${userListId}`);

    const collectionRef = getFirestore().collection('users').doc(userListId).collection('lists');

    const query = collectionRef.where('listId', '==', listInfo.id);

    query.get().then((querySnapshot) => {
  querySnapshot.forEach((doc) => {
    console.log(doc.id, doc.data());
  });
});
  }
  // sharedListPath = `sharedLists/${editorCode}`;
  // sharedListDocRef = getFirestore().doc(sharedListPath);
  // await sharedListDocRef.set({...data, shareType: 'editor'}, {merge: true});
});
