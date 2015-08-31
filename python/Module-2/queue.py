#!/usr/bin/env python
# py2.7
__author__ = 'ma11ock'

import threading, Queue, time

class WorkerThread(threading.Thread):
    def __init__(self,queue):
        threading.Thread.__init__(self)
        self.queue = queue

    def run(self):
        # put wtv code we want to run here
        print "In WorkerThread"
        while True:
            # Remove & return item from queue If optional args block = true & timeout = None (default), block if necessary until an item is available. If timeout is a positive number, it blocks at most timeout seconds and raises the Empty exception if no item was available within that time. Otherwise (block is false), return an item if one is immediately available, else raise the Empty exception (timeout is ignored in that case)
            counter = self.queue.get()
            print "counter: %d" % counter
            print "Ordered to sleep for %d seconds!" % counter
            time.sleep(counter)
            print "Finished sleeping for %d seconds" % counter
            # for each get() used to fetch task,subsequent call to task_done() tells queue that processing on task is complete
            self.queue.task_done()

# FIFO queue maxsize is int that sets upper limit on # of items that can be placed queue
# Insertion will block when size has been reached, until queue items are consumed
# If maxsize <= 0, queue size is infinite
queue = Queue.Queue()

# creating our threads
for i in range(10):
    print "Creating WorkerThread: %d" % i
        worker = WorkerThread(queue)
        worker.setDaemon(True)
        worker.start()
        print "WorkerThread %d Created!" % i

# building our queue
for j in range(10):
    queue.put(j)

# blocks until all items in queue r rtrvd & processed
# count of unfinished tasks goes up when item is added to queue
# count goes down when consumer thread calls task_done() -indicate item was rtrvd & all work on it is complete
# join() unblocks if count of unifished tasks = 0
queue.join()

print "All tasks complete"
