#!/usr/bin/python
__author__ = 'ma11ock'

import SocketServer

# EchoHandler - handle all clients connecting to server, could be fuzzer, could be data capture etc

class EchoHandler(SocketServer.BaseRequestHandler):

    def handle(self):
        print("client is: ", self.client_address)
        data = 'dummy'

        while len(data):
            data = self.request.recv(1024)
            print("client sent: ", data)
            self.request.send(data)

        print("client left")

serverAddr = ("0.0.0.0",9000)
server = SocketServer.TCPServer(serverAddr,EchoHandler)
server.serve_forever()