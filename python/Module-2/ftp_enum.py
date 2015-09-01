#!/usr/bin/env python
# py2
# NOTE    === not the most useful script - better to have this functionality built into something else
# PURPOSE === build list of 10 ftp sites start 5 threads that rtrv 2 from the queue, log in, list dir
__author__ = 'ma11ock'

import threading, Queue, time, sys
from ftplib import FTP

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
        site2 = self.queue.get()
        lock.acquire()
        try:
            print "------------------------"
            print "CONNECTING to: %s" % site
            print "CONNECTING to: %s" % site2
            ftp = FTP(site)                             # connect to host, default port
            ftp2 = FTP(site)
            print "LOGGING in to: %s" % site
            print "LOGGING in to: %s" % site2
            ftp.login()                                 # user anonymous, passwd anonymous@
            ftp2.login()
            print "----- dir contents -----\n"
            ftp.dir()                                   # list directory contents
            print "----- dir contents -----\n"
            ftp2.dir()
            print "\nEXITING: %s " % site
            print "EXITING: %s " % site2
        except:
            sys.exit("permission denied")
        finally:
            lock.release()
            self.queue.task_done()
            self.queue.task_done()


    def run(self):
        # put wtv code we want to run here
        print "In WorkerThread"
        while True:
            WorkerThread.ftp(self)

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

print
print "All tasks complete"


