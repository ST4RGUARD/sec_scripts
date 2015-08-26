__author__ = 'ma11ock'


import _thread
import time


def worker_thread(id):
    print("Thread ID %d now alive" % id)

    count = 1
    while True:
        print("Thread with ID %d has counter value %d" % (id, count))
        time.sleep(2)
        count += 1

for i in range(5):
    _thread.start_new_thread(worker_thread, (i,))

print("Main thread going for a infinite wait loop")
while True:
    pass