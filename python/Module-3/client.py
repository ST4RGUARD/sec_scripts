#!/usr/bin/python
__author__ = 'ma11ock'

import socket, sys

sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
sock.connect((sys.argv[1], 8000))

while 1:
    userInput = input("please enter a string: ")
    sock.send(userInput)
    print sock.recv(2048)

sock.close()