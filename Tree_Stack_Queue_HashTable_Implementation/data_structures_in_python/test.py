

def test(foo):
    foo = foo + 3
    print("inside function: {0}".format(foo))

if __name__ == "__main__":
    foo = 10
    print("Before calling: {0}".format(foo))
    test(foo)
    print("After calling: {0}".format(foo))


"""
Pass bby value: if arg is modified by function, not reflected outside of it
Pass by ref : if arg is modified by function, reflected outside of it
"""