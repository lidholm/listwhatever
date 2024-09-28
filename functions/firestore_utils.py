
import firebase_admin
from firebase_admin import firestore

default_app = firebase_admin.initialize_app()

def check_code_exists(code):
    db = firestore.client()
    
    lists_ref = db.collection_group('lists')
    
    query1 = lists_ref.where('shareCodeForViewer', '==', code).limit(1).get()
    query2 = lists_ref.where('shareCodeForEditor', '==', code).limit(1).get()
    
    if len(query1) > 0 or len(query2) > 0:
        return True
    else:
        return False
