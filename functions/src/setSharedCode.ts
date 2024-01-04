
import {onDocumentWritten} from 'firebase-functions/v2/firestore';
import {getFirestore} from 'firebase-admin/firestore';
import * as logger from 'firebase-functions/logger';

import * as firestoreUtils from './firestoreUtils';
import * as stringUtils from './stringUtils';


export const setShareCodes = onDocumentWritten('/lists/{listId}', async (event: any): Promise<void> => {
  const before = event.data.before.data();
  const apre = event.data.after.data();
  const listId = event.params.listId;

  const didSetToShared: boolean =
    apre.shared == true && before.shared != apre.shared &&
    (apre.shareCodeForViewer == undefined || apre.shareCodeForViewer == '') &&
     (apre.shareCodeForEditor == undefined || apre.shareCodeForEditor == '')
    ;

  if (!didSetToShared) {
    return;
  }

  const listPath = `/lists/${listId}`;
  const docRef = getFirestore().doc(listPath);
  const listInfo = (await docRef.get()).data();
  if (listInfo == undefined) {
    logger.log('Could not get data from list');
    return;
  }

  const userId = listInfo.ownerId;

  const shareCodes = await getUnusedShareCodes();
  const viewerCode = shareCodes[0];
  const editorCode = shareCodes[1];
  logger.log('viewerCode', viewerCode);
  logger.log('editorCode', editorCode);

  const codes = {shareCodeForViewer: viewerCode, shareCodeForEditor: editorCode};
  await docRef.set(codes, {merge: true});

  const userPath = `users/${userId}`;
  const userDocRef = getFirestore().doc(userPath);
  const userInfo = (await userDocRef.get()).data();

  const data = {
    ownerUserId: userId,
    ownerListId: listId,
    ownerName: userInfo?.name ?? 'Unknown user',
    listName: listInfo.name,
    listType: listInfo.listType,
  };

  let sharedListPath = `sharedLists/${viewerCode}`;
  logger.log('sharedListPath', sharedListPath);
  let sharedListDocRef = getFirestore().doc(sharedListPath);
  await sharedListDocRef.set({...data, shareType: 'viewer'}, {merge: true});

  sharedListPath = `sharedLists/${editorCode}`;
  sharedListDocRef = getFirestore().doc(sharedListPath);
  await sharedListDocRef.set({...data, shareType: 'editor'}, {merge: true});
});

export async function getUnusedShareCodes(): Promise<string[]> {
  const shareCodes = [];
  let shareCode = '';
  let alreadyExists = true;

  for (let i=0; i<2; i++) {
    while (alreadyExists) {
      shareCode = stringUtils.getRandomString(8);
      alreadyExists = await firestoreUtils.getCodeExists(shareCode);
      // console.log(shareCode, alreadyExists, i);
    }
    shareCodes.push(shareCode);
    alreadyExists = true;
  }

  return shareCodes;
}
