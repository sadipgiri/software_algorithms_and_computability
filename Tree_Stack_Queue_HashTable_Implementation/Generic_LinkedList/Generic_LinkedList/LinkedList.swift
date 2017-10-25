
import Foundation

class LinkedList <T: Equatable>
{
    var head : Node<T>?
    var tail : Node<T>?
    
    func insertAtHead( newNode : Node<T> )
    {
        
        if let head = head {
            
            head.prev = newNode
            newNode.next = head
            
        }
            
        else {
            
            tail = newNode
            
        }
        
        head = newNode
        
    }
    
    func insertAtTail( newNode : Node<T> )
    {
        
        if (head == nil) {
            
            insertAtHead(newNode: newNode)
            
        }
            
        else {
            
            tail?.next = newNode
            newNode.prev = tail
            tail = newNode
            
        }
        
        return
        
    }
    
    func insertAfter( _ node : Node<T>, newNode : Node<T> )
    {
        
        if (head == nil) {
            
            insertAtHead(newNode: newNode)
            
        }
            
        else if (tail! == node) { // cheacking whether that node is tail or not otherwise making it a tail
            
            insertAtTail(newNode: newNode)
        
        }
            
        else if (node == newNode) {
            
            // at first making a new temporary Node and then making a copy of it
            let temporaryNode: Node = Node(initialValue: newNode.value )
            
            // and then again calling the same function
            insertAfter(node, newNode: temporaryNode)
            
        }
            
        else {
            
            newNode.next = node.next
            node.next?.prev = newNode
            newNode.prev = node
            node.next = newNode
            
        }
        
        return

        
    }
    
    func removeHead()
    {
        
        if(head != nil) {
            
            // what if there is only one head/tail
            if head == tail {
                
                head = nil
                tail = nil
                
            }
                
            else {
                
                head = head?.next
                head?.prev = nil
                
            }
            
        }
        
        return
        
    }
    
    func removeTail()
    {
        
        if (tail != nil) {
            
            // what if there is only one node in the linked list
            if head == tail {
                
                tail = nil
                head = nil
                
            }
                
            else{
            
                tail = tail?.prev
                tail?.next = nil
                
            }
            
        }
        
        return
        
    }
    
    func remove( node : Node<T> )
    {
        
        if (head != nil) {
            
            if (node == head) {
                
                removeHead()
                
            }
                
            else if (node == tail) {
                
                removeTail()
                
            }
                
            else {
                
                node.prev?.next = node.next
                node.next?.prev = node.prev
                
            }
            
        }
        
        return
            
    }
        
        
    // created a Zero-Based Indexing
    func at( index : Int ) -> Node<T>?
    {
        // what if user try more indexing than the length of the linked list
        if (index + 1 > length) {
            
            print("Index is greater than length of the linkedList. So, try below length \(length)")
            
            return nil
            
        }
        
        if (head != nil) {
            
            // creating a current node for looping through linked list
            var currrentNode = head
            
            // at index 0 there's head node so returning it
            // needed this condition as I started current node as head node
            if index == 0 {
                
                return currrentNode
                
            }
                
            else {
                
                // starting from 1 inorder to maintain the Zero-based indexing and starting from the head node which is at 0 index
                for _ in 1...index {
                    
                    currrentNode = currrentNode?.next
                    
                }
                
                return currrentNode
                
            }
            
        }
        
        return nil  // returning nil fill the linkedlist is nil
        
    }
    
    
    //Doesn't work if the list is empty (head == nil), should return 0
    // maybe for counting the length of the given linkedlist
    var length : Int
    {
        if head == nil {
            
            return 0
            
        }
        
        var count = 1 // since I am starting from the head so
        
        if (head != nil) {
            
            var currentNode = head
            
            while (currentNode?.next != nil) {
                
                count = count + 1
                currentNode = currentNode?.next
                
            }
            
        }
        
        return count
        
    }
    
    //Level 2
    func removeAt( index : Int )
    {
        // what if user try more indexing than the length of the linked list
        if (index + 1 > length) {
            
            print("Index is greater than length of the linkedList. So, try below length \(length)")
            
            return
            
        }
        
        // at first, finding a node
        let removingNode = at(index: index)
                
        // using remove() function to remove that node
        remove(node: removingNode!)
        
    }
    
    func append( list : LinkedList )
    {
        
        if (list.head == nil) {
            
            return
            
        }
        
        if (head == nil) {
            
            // if head is not there then making linkedlist head and tail as list's head and tail respectively
            
            head = list.head
            tail = list.tail
            
        }
            
        else {
            
            // otherwise linkedlist tail will point to list head and list head.prev will point to linkedlist tail
            // and new tail will be list tail
            
            tail?.next = list.head
            list.head?.prev = tail
            tail = list.tail
            
        }
        
        return
        
    }
    
    func randomNode() -> Node<T>?
    {
        
        if head != nil {
            
            // generate random number according to the linkedlist length
            let randomNumber : UInt32 = arc4random_uniform(UInt32(length))
            
            // and then find out the random node using at() function
            return at(index: Int(randomNumber))!
            
        }
        
        // what if the linked list is empty
        print("LinkedList is empty.")
        
        return nil
        
    }
    
    func findFirst( key : T ) -> Node<T>?
    {
        // checking whether linkelist is empty or not
        if (head != nil) {
            
            var currentNode = head
            
            while (currentNode != nil) {
                
                if (currentNode!.value == key) {
                    
                    return currentNode
                    
                }
                
                currentNode = currentNode!.next
                
            }
            
        }
        
        return nil
        
    }
    
    //Provided
    var description : String
    {
        if head == nil
        {
            if tail != nil
            {
                return "There was a problem"
            }
            
            return "Empty list"
        }
        
        var tempNode = head
        var returnString = "Head: "
        while tempNode != nil
        {
            returnString += tempNode!.description + " "
            tempNode = tempNode!.next
        }
        returnString += "Tail: \(tail!)"
        return returnString
    }
    
}
