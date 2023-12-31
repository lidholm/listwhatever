import * as admin from 'firebase-admin';
import * as functions from 'firebase-functions';

const firestore = admin.firestore();

export const upperCaseV1 = functions.firestore.document('messages/{messageId}').onUpdate(
  async (change): Promise<void> => {
    const message = change.after.data();
    const originalMessage: string | undefined = message.original;
    const docId: string = change.after.id;

    if (originalMessage) {

      const docRef = firestore.collection('messages').doc(docId);

      const upper = originalMessage.toUpperCase();

      await docRef.set({
        uppercase: upper
      });
    }
  });
