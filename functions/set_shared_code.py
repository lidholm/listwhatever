from firebase_functions_v2.firestore import on_document_written
from firebase_admin import firestore
import firebase_functions.logger as logger
from . import firestoreUtils
from . import stringUtils

async def set_share_codes(event):
    before = event.data.before.data()
    apre = event.data.after.data()
    listId = event.params['listId']

    didSetToShared = apre.get('shared') == True and before.get('shared') != apre.get('shared') and \
                     (apre.get('shareCodeForViewer') == None or apre.get('shareCodeForViewer') == '') and \
                     (apre.get('shareCodeForEditor') == None or apre.get('shareCodeForEditor') == '')

    if not didSetToShared:
        return

    listPath = f"/lists/{listId}"
    doc_ref = firestore.client().document(listPath)
    list_info = (await doc_ref.get()).to_dict()
    if list_info == None:
        logger.log('Could not get data from list')
        return

    userId = list_info['ownerId']

    share_codes = await get_unused_share_codes()
    viewer_code = share_codes[0]
    editor_code = share_codes[1]
    logger.log('viewerCode', viewer_code)
    logger.log('editorCode', editor_code)

    codes = {'shareCodeForViewer': viewer_code, 'shareCodeForEditor': editor_code}
    await doc_ref.set(codes, merge=True)

    user_path = f"users/{userId}"
    user_doc_ref = firestore.client().document(user_path)
    user_info = (await user_doc_ref.get()).to_dict()

    data = {
        'ownerUserId': userId,
        'ownerListId': listId,
        'ownerName': user_info.get('name', 'Unknown user'),
        'listName': list_info['name'],
        'listType': list_info['listType']
    }

    shared_list_path = f"sharedLists/{viewer_code}"
    logger.log('sharedListPath', shared_list_path)
    shared_list_doc_ref = firestore.client().document(shared_list_path)
    await shared_list_doc_ref.set({**data, 'shareType': 'viewer'}, merge=True)

    shared_list_path = f"sharedLists/{editor_code}"
    shared_list_doc_ref = firestore.client().document(shared_list_path)
    await shared_list_doc_ref.set({**data, 'shareType': 'editor'}, merge=True)

async def get_unused_share_codes():
    share_codes = []
    share_code = ''
    already_exists = True

    for i in range(2):
        while already_exists:
            share_code = stringUtils.get_random_string(8)
            already_exists = await firestoreUtils.get_code_exists(share_code)
            # print(share_code, already_exists, i)
        share_codes.append(share_code)
        already_exists = True

    return share_codes
