__author__ = 'ma11ock'

# write file
fdesc = open("file.txt", "w")
fdesc.write("blah")

# append file
fdesc = open("file.txt", "a")
fdesc.write("extra")

# close file
fdesc.close()

# read file
fdesc = open("file.txt", "r")

# readlines
for line in fdesc.readlines():
    print(line.strip())

# EXERCISE
# read /var/log/messages

# find logs pertaining to USB & print them out