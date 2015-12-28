#!/usr/bin/python
__author__ = 'ma11ock'


import SocketServer, SimpleHTTPServer


class HttpRequestHandler(SimpleHTTPServer.SimpleHTTPRequestHandler):
    # overwrite GET request
    def do_GET(self):
        if self.path == '/admin':
            self.wfile.write('This page is only for Admins!\n')
            self.wfile.write(self.headers)
        else:
            SimpleHTTPServer.SimpleHTTPRequestHandler.do_GET(self)


httpServer = SocketServer.TCPServer(('',10001), SimpleHTTPServer.SimpleHTTPRequestHandler)
httpServer.serve_forever()
