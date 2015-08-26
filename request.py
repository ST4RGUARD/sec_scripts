#!/usr/bin/python
# send a POST/ data to an ip address/port
import socket, sys
import random

def create_attack():
    buf = ''
    num = random.randrange(25,101)

    for i in range(num):
        alpha = random.randrange(7,127)
        buf += chr(alpha)

    buffer = "GET " + buf
    buffer += "https://www.youtube.com/watch?v=1QxeuAuj0qo"
    #buffer += "HTTP/1.1\r\n"
    #buffer += "Connection: keep-alive\r\n\r\n"
    print buffer
    return buffer

def send_attack():
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    sock.connect(("192.168.53.134",80))
    sock.send(create_attack())
    sock.close()

send_attack()
