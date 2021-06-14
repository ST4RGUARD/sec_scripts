__author__ = 'ma11ock'

import sys


def print5times(line):

    for count in range(0, 5):
        print(line)

print5times(sys.argv[1])
