#!/usr/bin/python

# example taken and modified from python 3.5.1 Documentation - Selectors 18.4

import socket, selectors

sel = selectors.DefaultSelector()


def accept(sock, mask):
    conn, addr = sock.accept()  # Should be ready
    print('accepted', conn, 'from', addr[0])
    conn.setblocking(False)
    sel.register(conn, selectors.EVENT_READ, read)


def read(conn, mask):
    data = conn.recv(1000)  # Should be ready
    if data:
        print('echoing', repr(data), 'to', conn)
        conn.send(data)  # Hope it won't block
    else:
        print('closing', conn)
        sel.unregister(conn)
        conn.close()


sock = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
# allow address to be re-used
sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR,1)
sock.bind(("0.0.0.0", 8000))
sock.listen(2)
sock.setblocking(False)
sel.register(sock, selectors.EVENT_READ, accept)
print("Waiting for a Client ..")


while True:
    events = sel.select()
    for key, mask in events:
        callback = key.data
        callback(key.fileobj, mask)