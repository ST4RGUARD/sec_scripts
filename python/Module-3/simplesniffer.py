#!/usr/bin/python
__author__ = 'ma11ock'

import socket, struct, binascii

# htons /include/linux/if_ether.h -> defined ether protocol IDs
# need to be root for rawSockets
# PF_INET not available
rawSocket = socket.socket(socket.AF_INET, socket.SOCK_RAW, socket.htons(0x0800))
print(rawSocket)

rawSocket.bind(("127.0.0.1", socket.htons(0x0800)))

# eth hdr only -> py 3 b tells python bytes object - i hate you python!
pkt = struct.pack("!6s6s2s", b'\xaa\xaa\xaa\xaa\xaa\xaa', b'\xbb\xbb\xbb\xbb\xbb\xbb', b'\x00\x00')

print(pkt)

rawSocket.send(pkt + b"hello there")

etherHdr = pkt[0][0:14]

hdr = etherHdr.unpack("!6s6s2s", etherHdr)

binascii.hexlify(hdr[0])
binascii.hexlify(hdr[1])
binascii.hexlify(hdr[2])

ipHdr = pkt[0][14:34]

ip_hdr = struct.unpack("!12s4s4s",ipHdr)

print("Src IP = ") + socket.inet_ntoa(ip_hdr[1])
print("Dest IP = ") + socket.inet_ntoa(ip_hdr[2])

tcpHdr = pkt[0][34:54]

tcp_hdr = struct.unpack("!HH16s", tcpHdr)