#!/usr/bin/env python3
"""
	Stack.py - Python3 program.
	Author: Sadip Giri (sadipgiri@bennington.edu)
	Created: 9/29/2017
"""

class Stack(object):
    def __init__(self):
        self.track = -1
        self.stackArray = []

    def push(self, element):
        self.stackArray.append(element)
        self.track = self.track + 1

    def top(self):
        top_el = self.stackArray[self.track]
        self.track = self.track - 1
        return top_el

stack1 = Stack()
stack1.push(100)
stack1.push(200)
print(stack1.top())