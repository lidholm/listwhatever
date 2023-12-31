
import {onDocumentWritten} from 'firebase-functions/v2/firestore';
import {getFirestore} from 'firebase-admin/firestore';
import * as logger from 'firebase-functions/logger';

export const addUserToSharedList = onDocumentWritten('sharedLists/{shareCode}/users/{userId}', async (event: any): Promise<void> => {
  logger.log('addUserToSharedList');

  const apre = event.data.after.data();
  const userId = event.params.userId;
  const shareCode = event.params.shareCode;

  if (apre == null) {
    logger.log('User is deleted');
    return;
  }

  const shareInfoPath = `sharedLists/${shareCode}`;
  logger.log('shareInfoPath', shareInfoPath);
  const shareInfo = (await getFirestore().doc(shareInfoPath).get()).data();
  if (shareInfo == undefined) {
    logger.log('Could not get data from shareInfo');
    return;
  }

  logger.log('shareInfo', shareInfo);

  const type = shareInfo.shareType;
  const listPath = `lists/${shareInfo.ownerListId}`;
  logger.log(listPath);

  const sharedWith: { [key: string]: string } = {};
  sharedWith[userId] = type;
  const data = {sharedWith: sharedWith};

  const docRef = getFirestore().doc(listPath);
  await docRef.set(data, {merge: true});

  const list = (await docRef.get()).data();
  logger.log('list:', list);

  const sharedListsPath = `users/${userId}/lists`;
  const collRef = getFirestore().collection(sharedListsPath);

  const userList = {
    listId: shareInfo.ownerListId,
    listName: shareInfo.listName,
    listType: shareInfo.listType,
    ownerId: shareInfo.ownerUserId,
  };
  logger.log('userList', userList);
  await collRef.add(userList);
});
