
import Foundation

class Queue <T>
{
    
    var head: Node<T>?
    
    var tail: Node<T>?
    
    // to keep track of everything from enqueue to dequeue
    // helps make size run in constant time
    var track: Int = -1
    
    func enqueue(element: T) {
        
        // at first creating a Node
        let tempNode = Node(initialValue: element)
        
        // using insertAtTail function to enqueue at tail part
        insertAtTail(newNode: tempNode)
        
        // increasing by one step as we just enqueued
        track = track + 1
        
    }
    
    
    // it removes as well as returns the element
    func dequeue() -> T? {
        
        if track == -1 {
            
            print("You cannot Dequeue. Queue is Empty!")
            
            return nil
            
        }
        
        let tempNode = head
        
        removeHead()
        
        track = track - 1
        
        return tempNode?.value
        
    }
    
    
    // returns the front element
    func front() -> T? {
        
        if track == -1 {
            
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
        track = -1
        
    }
    
    
    // making size function of constant time
    var size: Int {
        
        return track + 1
        
    }
    
    
    var isEmpty: Bool {
        
        if track == -1 {
            
            return true
            
        }
            
        else {
        
            return false
            
        }
        
    }
    
    
    // for printing in nice format
    var description : String
    {
        if track == -1
        {
            
            return "Queue is Empty."
    
        }
        
        var tempNode = head
        
        var returnString = "Front: "
        
        while tempNode != nil
        {
        
            returnString += tempNode!.description + " "
            
            tempNode = tempNode!.next
        
        }
        
        returnString += "Tail"
        
        return returnString
    
    }
    
    
    // creating another function called insertAtTail
    // it helps to enqueue at the tail part
    private func insertAtTail(newNode: Node<T>) {
        
        if track == -1 {
            
            head = newNode
    
            tail = newNode
            
        }
        
        tail?.next = newNode
        
        tail = newNode
        
    }
    
    
    // again creating another funciton called removeHead()
    // it helps to dequeue from the head
    private func removeHead() {
        
        if track == -1 {
            
            return
            
        }
        
        head = head?.next
        
    }
    
    
}
