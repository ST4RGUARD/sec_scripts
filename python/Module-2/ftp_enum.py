#!/usr/bin/env python
# py2
__author__ = 'ma11ock'

import threading, Queue, time, sys
from ftplib import FTP

# currently running for loop at bottom creating 5 threads and only pulling
# first 5 sites from queue - investigate

# just some sites that allow anon login
ftp_sites = [
            "ftp.leadtek.com.tw","ftp.gbnet.net","ftp.muze.nl",
            "ftp.radius.cistron.nl","ftp.sci.kun.nl","ftp.stack.nl",
            "ftp.th.vu.nl","ftp.tue.nl","ftp.vu.nl",
            "ftp.corel.ca"
            ]

lock = threading.Semaphore(value=1)


class WorkerThread(threading.Thread):
    def __init__(self,queue):
        threading.Thread.__init__(self)
        self.queue = queue

    def ftp(self):
        site = self.queue.get()
        lock.acquire()
        try:
            print "------------------------"
            print "connecting to site: %s" % site
            ftp = FTP(site)                             # connect to host, default port
            print "logging in to site: %s" % site
            ftp.login()                                 # user anonymous, passwd anonymous@
            print "----- dir contents -----\n"
            ftp.dir()                                   # list directory contents
            print "exiting site: " % site
        except:
            sys.exit("permission denied")
        finally:
            lock.release()
            self.queue.task_done()

    def run(self):
        # put wtv code we want to run here
        print "In WorkerThread"
        while True:
            2*WorkerThread.ftp(self)

queue = Queue.Queue()
for j in ftp_sites:
    queue.put(j)

for i in range(5):
    lock.acquire()
    print "Creating WorkerThread: %d" % i
    worker = WorkerThread(queue)
    worker.setDaemon(True)
    worker.start()
    print "WorkerThread %d Created!" % i
    lock.release()

queue.join()

print "All tasks complete"


