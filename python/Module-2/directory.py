__author__ = 'ma11ock'

import glob
import os
import sys


# print(os.getcwd())
#os.mkdir("newdir")
#os.rmdir() - removes empty dir
#os.remove() - removes file
#shutil.rmtree() - removes dir & contents
# print(os.listdir("."))
#
# for item in os.listdir("."):
#     if os.path.isfile(item):
#         print(item + " is a file")
#     elif os.path.isdir(item):
#         print(item + " is a directory")
#     else:
#         print("unknown")


#glob not great for large files
# for item in glob.glob(os.path.join(".", "*.py")):
#     print(item)

print()
print()

for dirpath, dirs, files in os.walk("."):
    path = dirpath.split('/')
    print('|', (len(path))*'---', '[', os.path.basename(dirpath), ']')
    for dir in dirs:
        directory = dir

    for f in files:
        cwd = path
        # print(path)
        # if dirs empty append ..if dirs = dirs append
        if path is not None:
            # need to distinguish dir from file
            if path != cwd:
                path.append(f)
        print('|', (len(path))*'---', '[', f, ']')


print()
print()

try:
    sys.argv[1]
except:
    path = os.getcwd()
else:
    path = sys.argv[1]


def listdir(dir=path, depth=1):

    for f in glob.glob(os.path.join(dir + "/*")):
        if os.path.isdir(f):
            print(depth*"----" + " [" + f.split("/").pop() + "]")
            listdir(f, depth+1)
        else:
            print(depth*"----" + " [" + f.split("/").pop() + "]")

print(path)
listdir()
