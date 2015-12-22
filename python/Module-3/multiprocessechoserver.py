#!/usr/bin/python
__author__ = 'ma11ock'

import os, socket, time


tcpSocket = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
# allow address to be re-used
tcpSocket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR,1)
tcpSocket.bind(("0.0.0.0", 8000))
tcpSocket.listen(2)
print "Waiting for a Client .."


def echo_server():
    (client, (ip, port)) = tcpSocket.accept()

    childpid = os.fork()
    if childpid == 0:
        child_process()

    print "rcvd connection from : ", ip
    print "starting echo output ..."
    time.sleep(2)
    data = 'dummy'

    while len(data):
        data = client.recv(2048)
        print "pid is ", os.getpid()
        print ip, " sent: ", data
        client.send(data)

    client.close()


def child_process():
    print("I am the child & my pid is: %d" % os.getpid())
    echo_server()
    print("child is exiting")


def parent_process():
    print("I am the parent & my pid is: %d" % os.getpid())
    echo_server()
    print("parent is exiting")


parent_process()
