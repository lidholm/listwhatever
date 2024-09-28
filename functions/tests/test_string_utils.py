import unittest
from unittest.mock import MagicMock
from  string_utils import get_random_string

class TestMain(unittest.TestCase):
    def test_on_request_example(self):
        # Create a mock request object
        request = MagicMock()

        # Call the function being tested
        response = get_random_string(5)

        # Assert the response
        self.assertEqual(len(response), 5)

        # Call the function being tested
        response = get_random_string(15)

        # Assert the response
        self.assertEqual(len(response), 15)
