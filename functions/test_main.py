import unittest
from unittest.mock import MagicMock
from  string_utils import StringUtils

class TestMain(unittest.TestCase):
    def test_on_request_example(self):
        # Create a mock request object
        request = MagicMock()

        stringUtils = StringUtils()

        # Call the function being tested
        response = stringUtils.get_random_string(5)

        # Assert the response
        self.assertEqual(len(response), 5)

        