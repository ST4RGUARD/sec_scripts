__author__ = 'ma11ock'


import os


def child_process():

    print("I am the child & my pid is: %d" % os.getpid())
    print("child is exiting")


def parent_process():

    print("I am the parent & my pid is: %d" % os.getpid())
    childpid = os.fork()

    if childpid == 0:
        #we are inside child
        child_process()
    else:
        #we are inside the parent process
        print("inside parent")
        print("our child has the pid: %d" % childpid)


parent_process()

os.execvp("ping", ["ping", "127.0.0.1"])