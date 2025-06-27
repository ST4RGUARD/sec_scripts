#!/usr/bin/python

# name = input("What is your name?")
#
# print("Your name is " + name)
#
# if name == "ja":
#     print("you are " + name)
#     print("buster")
# elif name == "jarrod":
#
# else:
#     print("Unknown")

cond = True

while cond:
    age = int(input("what is your age? "))
    if age > 10:
        print("Your age is > 10")
    else:
        print("your age is <= 10")
        cond = False
else:
    print("i die")
# %%
items = [1, 3, 4]

for num in items:
    print(num)

for item in range(1, 10, 2):
    print(item)
# %%
