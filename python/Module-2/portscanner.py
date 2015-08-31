#!/usr/bin/env python

__author__ = 'ma11ock'
__version__ = '0.5' # major re-write cred to atomicmaster

import os, sys, argparse, socket, threading

DEBUG = False
if DEBUG:
    import pprint
    pp = pprint.PrettyPrinter(depth=6, indent=4)

# we need this to make sure that multiple threads dont print to screen at the same time
lock = threading.Semaphore(value=1)


''' Define some functions '''
def check_port(host, port):
    if DEBUG:
        print 'trying ' + host + ':'+str(port)
    try:
        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        sock.settimeout(1)
        sock.connect((host, int(port)))
        # just for kicks, lets see if there is a banner we can grab
        sock.send("Knock Knock\r\n")
        banner = sock.recv(1024)
        lock.acquire() # This way we are the only people printing to the console
        print '[+] %d/tcp open'% port
        if len(banner) > 0:
            print '[+] ' + str(banner)
    except:
        lock.acquire()
        #print '[-] %d/tcp closed'% port
    finally:
        lock.release()
        sock.close()
    return

def scan(host, ports):
    lock.acquire()
    print "-" * 60
    print "Scanning: ", host
    print "-" * 60
    lock.release()

    threads = list()
    for port in ports:
        thread = threading.Thread(target=check_port, args=(host, port))
        thread.start() #yeah thats really all you need
        threads.append(thread)
   # for thread in threads:
   #     thread.join()

''' Main '''
def main():
    ''' Parse Arguments '''
    # old way was a bit dirty, this is legit though
    parser = argparse.ArgumentParser()
    # add options
    parser.add_argument('-n', action='store', dest='host', help='Name or IP of the node you want to scan.')
    parser.add_argument('-p', action='append', dest='ports', default=[], help='Port or port range. You can add multiple -p(s)')
    # parse
    args = parser.parse_args()

    if DEBUG:
        print 'Args: '
        pp.pprint(args)

    ''' Make sure we have what we need, and can reach the target '''
    # we cant run if we dont have ports
    if len(args.ports) == 0:
        print parser.usage
        sys.exit("No ports or port ranges provided")
    # we can ask for a host to scan
    if len(args.host) == 0:
        host = input("Enter hostname or IP to scan: ")
    else:
        host = args.host
    # get ip if we have name, get name if we have ip
    try:
        host_ip = socket.gethostbyname(host)
    except:
        sys.exit('Host name or IP could not be found')

    ports=list()
    for port in args.ports:
        if port.isdigit():
            ports.append(int(port))
        else:
            try:
                port_range = port.split('-')
                port_range = range(int(port_range[0]), int(port_range[1]))
                ports += port_range
            except:
                print 'Invalid port range %(port)s'
    if DEBUG:
        print 'Ports: '
        pp.pprint(ports)

    scan(host, ports)

if __name__ == '__main__':
    main()