from firebase_functions.firestore_fn import (
  on_document_created,
  on_document_deleted,
  on_document_updated,
  on_document_written,
  Event,
  Change,
  DocumentSnapshot,
)
from firebase_admin import firestore

def adding_user_to_shared_list(event):
    print('addingUserToSharedList')
    new_value = event.data.after.to_dict()
    prev_value = event.data.before.to_dict()
    print(new_value)
    print(prev_value)

    userId = event.params['userId']
    shareCode = event.params['shareCode']

    if new_value is None:
        print('User is deleted')
        return

    share_info_path = f'sharedLists/{shareCode}'
    print('shareInfoPath', share_info_path)
    share_info = firestore.client().document(share_info_path).get().to_dict()
    if share_info is None:
        print('Could not get data from shareInfo')
        return

    print('shareInfo', share_info)

    share_type = share_info['shareType']
    list_path = f'lists/{share_info["ownerListId"]}'
    print(list_path)

    shared_with = {userId: share_type}
    data = {'sharedWith': shared_with}

    doc_ref = firestore.client().document(list_path)
    doc_ref.set(data, merge=True)

    list_data = doc_ref.get().to_dict()
    print('list:', list_data)

    shared_lists_path = f'users/{userId}/lists'
    coll_ref = firestore.client().collection(shared_lists_path)

    user_list = {
        'listId': share_info['ownerListId'],
        'listName': share_info['listName'],
        'listType': share_info['listType'],
        'ownerId': share_info['ownerUserId'],
    }
    print('userList', user_list)
    coll_ref.add(user_list)

