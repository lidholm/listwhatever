
import {onDocumentWritten} from 'firebase-functions/v2/firestore';
import {getFirestore} from 'firebase-admin/firestore';
import * as logger from 'firebase-functions/logger';

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

    const querySnapshot = await query.get();
    for (const doc of querySnapshot.docs) {
      const docId = doc.id;
      const userList = doc.data();
      console.log('docId: ', docId);
      console.log('userList: ', userList);

      userList.listName = listInfo.name;
      userList.listType = listInfo.listType;
      userList.imageFilename = listInfo.imageFilename;

      console.log(doc.id, userList);

      const userListPath = `users/${userListId}/lists/${docId}`;
      const userListDoc = getFirestore().doc(userListPath);
      await userListDoc.set(userList, {merge: true});
    }
  }
});
