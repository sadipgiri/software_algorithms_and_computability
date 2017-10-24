
import Foundation

class Node <T>
{
    
    var value: T?
    
    var next: Node?
    
    init(initialValue: T) {
        
        value = initialValue
        
    }
    
    var description : String {
        
        if let value = value {
            
            return "\(value) \(next == nil ? ":" : "->" )"
            
        }
            
        else {
            
            return ""
            
        }
        
    }
    
    
}
