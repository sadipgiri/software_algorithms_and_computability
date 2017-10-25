//
//  main.swift
//  Generic_LinkedList
//
//  Created by Sadip giri on 3/8/17.
//  Copyright © 2017 Sadip giri. All rights reserved.
//

import Foundation


var node1 = Node(initialValue: "Sadip")
var node2 = Node(initialValue: "Giri")
var node3 = Node(initialValue: "Yop")
var node4 = Node(initialValue: "Bennington")

var list = LinkedList<String>()
list.insertAtHead(newNode: node1)
list.insertAtHead(newNode: node2)
//list.insertAtTail(newNode: node4)
//list.insertAfter(node2, newNode: node3)
//list.removeHead()
print(list.description)
//print(list.randomNode()!)
//print(list.findFirst(key: "Sadip")!)
//print(list.at(index: 0))
print(list.description)
print(list.removeAt(index: 0))
print(list.description)
//list.removeHead()
list.remove(node: node1)
//print(list.randomNode()!)
print(list.description)




