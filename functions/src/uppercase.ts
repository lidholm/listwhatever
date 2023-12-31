
const { onDocumentWritten } = require("firebase-functions/v2/firestore");
const {getFirestore} = require("firebase-admin/firestore");


export const upperCase = onDocumentWritten("messages/{messageId}", async (event:  any): Promise<void> => {
    const message = event.data.after.data();
    const originalMessage: string | undefined = message.original;
    const docId: string = event.data.after.id;

    if (originalMessage) {
      const docRef = getFirestore().collection('messages').doc(docId);

      const upper = originalMessage.toUpperCase();

      await docRef.set({
        uppercase: upper
      }, {merge: true});
    }
  });
