
const {getFirestore} = require("firebase-admin/firestore");
const logger = require("firebase-functions/logger");

export async function getCodeExists(code: string) {
console.log('in getCodeExists', code);
  let existingWithSameCode = getFirestore().collectionGroup('lists')
      .where('shareCodeForViewer', '==', code);
  let snapshot = await existingWithSameCode.count().get();
  logger.log("count", snapshot.data().count);
  if (snapshot.data().count > 0) {
    return true;
  }

  existingWithSameCode = getFirestore().collectionGroup('lists')
      .where('shareCodeForEditor', '==', code);
  snapshot = await existingWithSameCode.count().get();
  logger.log("count", snapshot.data().count);
  if (snapshot.data().count > 0) {
    return true;
  }

  return false;
}