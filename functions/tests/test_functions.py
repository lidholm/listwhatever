import unittest
from main import on_request_example

class TestMainFunction(unittest.TestCase):

    def test_hello_world(self):
        from firebase_admin import firestore

