
from firebase_admin import initialize_app

from firebase_functions import https_fn
from firebase_functions.firestore_fn import (
  on_document_created,
  on_document_deleted,
  on_document_updated,
  on_document_written,
  Event,
  Change,
  DocumentSnapshot,
)

initialize_app()
@on_document_written(document="messages/{messageId}")
def uppercase(event: Event[Change[DocumentSnapshot]]) -> None:
    new_value = event.data.after
    prev_value = event.data.before

    print(new_value.to_dict())

    orig = new_value.to_dict().get("original", None)
    uppNow = new_value.to_dict().get("upper", None)

    upp = orig.upper()

    if uppNow != upp:
        new_value.reference.update({"upper": upp})

@https_fn.on_request()
def on_request_example(req: https_fn.Request) -> https_fn.Response:
    return https_fn.Response("Hello world!")
