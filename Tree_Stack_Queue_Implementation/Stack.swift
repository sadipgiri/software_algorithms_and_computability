
import Foundation

class Stack <T>
{
    // creating a Dynamic array (Swift does it nicely)
    var stackArray = [T]()
    
    // But we can still create a fixed size of an array and make it dynamic
    var value: T?
    
    private var top: Int = -1   // default setting top to -1 to keep track of everything (also, to implement Zero-based indexing too)
                                // specially top can be used to check the size of the array so that we'd create new Array size (double the previous) and copy everything in it whereas Swift does it for me -- so sweet!!
    func push(element: T)
    {
        
        stackArray.append(element)
        
        // since element is added so top will be increased by 1
        top = top + 1
        
    }
    
    
    func pop() -> T?
    {
        
        if top == -1 {  // if the array is empty
            
            print("You cannot Pop. Stack is Empty!")
            
            return nil
            
        }
        
        let topOfStack = stackArray[top]
        
        stackArray.remove(at: top)
        
        top = top - 1
        
        return topOfStack
        
    }
    
    
    func peek() -> T?
    {
        
        if top == -1 {
            
            print("You peeked. But stack is Empty!")
            
            return nil
            
        }
        
        return stackArray[top]
        
    }
    
    
    func clear() {
        
        stackArray.removeAll()
        
        top = -1    // since it removes all so setting top to it's original value
        
    }
    
    
    var size: Int {
        
        return top + 1
        
    }
    
    
    var isEmpty: Bool {
        
        if top == -1 {
            
            return true
            
        }
            
        else {
            
            return false
            
        }
        
    }
    
    
    var description: String {
        
        if top == -1 {
            
            return "Stack is Empty"
            
        }
        
        var returnString = "Bottom: "
        
        for i in stackArray {
            
            returnString += String(describing: i) + " "
            
        }
        
        returnString += "Peek: \(stackArray[top])"
        
        return returnString
        
    }
    
}



