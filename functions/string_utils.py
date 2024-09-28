
import random
import string

class StringUtils:
    def __init__(self):
        pass

    def get_random_string(self, length):
        letters = string.ascii_letters
        return ''.join(random.choice(letters) for _ in range(length))
    