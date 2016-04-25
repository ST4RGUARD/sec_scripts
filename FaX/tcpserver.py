#!/usr/bin/python
__author__ = 'ma11ock'

import SocketServer,socket,errno

# EchoHandler - handle all clients connecting to server, could be fuzzer, could be data capture etc

class EchoHandler(SocketServer.BaseRequestHandler):

    def handle(self):
        print("client is: ", self.client_address)
        data = 'dummy'

        try:
            while len(data):
                data = self.request.recv(1024)
                print("client sent: ", data)
                fdesc = open("C:\\fuzzer\\log\\log.txt","a")
                fdesc.write(data)
                self.request.send(data)
        except socket.error as error:
            if error.errno == errno.WSAECONNRESET:
                print("i'm breaking here")
            else:
                raise
            
        print("client left")


try:
	serverAddr = ("0.0.0.0",9000)
	server = SocketServer.TCPServer(serverAddr,EchoHandler)
	server.serve_forever()
	print "[+] log server connected"
except socket.error:
	print "[+] log server is up"

