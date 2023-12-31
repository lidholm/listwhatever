
const { onDocumentWritten } = require("firebase-functions/v2/firestore");
const {getFirestore} = require("firebase-admin/firestore");
const logger = require("firebase-functions/logger");

export const addUserToSharedList = onDocumentWritten("sharedLists/{shareCode}/users/{userId}", async (event:  any): Promise<void> => {
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
    logger.log('shareInfo', shareInfo);

    const type = shareInfo.shareType;

    const listPath = `lists/${shareInfo.ownerListId}`;
    logger.log(listPath);
    let docRef = getFirestore().doc(listPath);

    const data = {sharedWith: {}};
    data['sharedWith'][userId] = type;

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
