#!/usr/bin/env python

__author__ = 'ma11ock'
import socket
import sys
import _thread

server = input("Enter host to scan: ")
server_ip = socket.gethostbyname(server)

if sys.argv[1] == "-h" or sys.argv[1] == "--help":
    print("enter port range to scan -> 0 100")

elif(0 <= int(sys.argv[1]) <= 65536) \
        and (int(sys.argv[1]) <= int(sys.argv[2])) \
        and (0 <= int(sys.argv[2]) <= 65536):
        first_port = int(sys.argv[1])
        last_port  = int(sys.argv[2])
else:
    print("invalid input")
    # term script


print("-" * 60)
print("scanning host", server_ip)
print("-" * 60)


def create_threads():

    ports = last_port - first_port
    mod_ports = ports % 10

    if mod_ports > 0:
        ports -= mod_ports
        _thread.start_new_thread(scanning(ports, last_port))
        for port in range(first_port, ports, 10):
            _thread.start_new_thread(scanning, (first_port, ports), (port,))
    else:
        for port in range(first_port, last_port, 10):
            if ports >= 10:
                end_port = port + 10
            _thread.start_new_thread(scanning, (port, end_port))


def scanning(begin, end):
    for port in range(begin, end):
        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        result = sock.connect_ex((server_ip, port))

        if result == 0:
            print("Port {}: \t Open".format(port))

        sock.close()

create_threads()

print("completed")
