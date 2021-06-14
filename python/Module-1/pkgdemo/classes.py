__author__ = 'ma11ock'


class Calculator:

    def __init__(self, ina, inb):
        self.a = ina
        self.b = inb

    def add(self):

        return self.a + self.b

    def multiply(self):

        return self.a * self.b


class Scientific(Calculator):

    def power(self):

        return pow(self.a, self.b)

def quick_add(a, b):

    return a + b

newCalculation = Calculator(10, 20)
newPower = Scientific(2, 3)

print('a+b: %d' % newCalculation.add())
print('a*b: %d' % newCalculation.multiply())

# Scientific inherits from Calculator
print('a*b: %d' % newPower.multiply())
print('a+b: %d' % newPower.add())
print('a pow b: %d' % newPower.power())

# globvar = 0
#
#
# def set_globvar_to_one():
#
#     # global globvar    # Needed to modify global copy of globvar
#     globvar = 1
#
#
# def print_globvar():
#
#     print(globvar)     # No need for global declaration to read value of globvar
#
# set_globvar_to_one()
# print_globvar()
