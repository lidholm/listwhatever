
import random
import string


def get_random_string(length):
    letters = string.ascii_letters
    digits = string.digits
    both = letters + digits
    return ''.join(random.choice(letters) for _ in range(length))
    