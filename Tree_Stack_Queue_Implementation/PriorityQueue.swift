
import Foundation

class PriorityQueue <T> {
    
    var head: Node<T>?
    
    var tail: Node<T>?
    
    var currentPriority:Int = 0
    
    // to keep track of everything from enqueue to dequeue
    // helps make size run in constant time
    var count: Int = -1
    
    
    func enqueue(element: T, priority: Int) {
        
        let tempNode = Node(initialValue: element)
        
        // checking previous priority and then if its of higher priority than inserting it in the head
        // else as usual
        if  priority >= currentPriority {
            
            insertAtHead(newNode: tempNode)
            
            currentPriority = priority
            
            count = count + 1
            
        }
            
        else{
            
            insertAtTail(newNode: tempNode)
            
            count = count + 1
            
        }
        
    }
    
    
    func dequeue() -> T? {
        
        if count == -1 {
            
            print("You cannot Dequeue. Queue is Empty!")
            
            return nil
            
        }
        
        let tempNode = head
        
        removeHead()
        
        count = count - 1
        
        return tempNode?.value
    }
    
    
    func front() -> T? {
        
        
        if count == -1 {
            
            print("Queue is Empty!")
            
            return nil
            
        }
        
        return head?.value
        
    }
    
    
    func clear() {
        
        var tempNode = head
        
        for _ in 1...size {
            
            // using the existing funciton
            dequeue()
            
            tempNode = tempNode?.next
            
        }
        
        // since track's original value is -1
        count = -1
        
    }
    
    var size: Int {
        
        return count + 1
        
    }
    
    var isEmpty: Bool {
        
       return (count == -1)
        
    }
    
    // creating another function called insertAtTail
    // it helps to enqueue at the tail part
    private func insertAtTail(newNode: Node<T>) {
        
        if count == -1 {
            
            head = newNode
            
            tail = newNode
            
        }
        
        tail?.next = newNode
        
        tail = newNode
        
    }
    
    
    // again creating another funciton called removeHead()
    // it helps to dequeue from the head
    private func removeHead() {
        
        if count == -1 {
            
            return
            
        }
        
        head = head?.next
        
    }
    
    // inserting according to priority
    private func insertAtHead( newNode : Node<T> )
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
    
    // for printing in nice format
    var description : String
    {
        if count == -1
        {
            
            return "Queue is Empty."
            
        }
        
        var tempNode = head
        
        var returnString = "Front: (priority = \(currentPriority)) "
        
        while tempNode != nil
        {
            
            returnString += tempNode!.description + " "
            
            tempNode = tempNode!.next
            
        }
        
        returnString += "Tail"
        
        return returnString
        
    }
    
    
}
