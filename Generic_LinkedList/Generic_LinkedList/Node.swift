//
//  Node.swift
//  LinkedList
//
//  Created by Justin Vasselli on 2/20/17.
//  Copyright © 2017 Justin Vasselli. All rights reserved.
//

import Foundation

// here NSObject leads me to do binary operation whether objects are of <any> type
// Thanks Justin!
class Node <T: Equatable> : NSObject
{
    var value : T?
    var next : Node?
    var prev : Node? //Ignore this if level 1
    
    init( initialValue : T? )
    {
        
        value = initialValue
        
    }
    
    override var description : String {
        
        // using optional chaining rahter than force unwrapping which printed "optional" in output too
        if let value = value {
            
            return "\(value) \(next == nil ? "//" : "->" )"
            
        }
            
        else {
            
            return ""
            
        }
        
    }
    
}

/*extension Node: Equatable {
    func ==(lhs: Node, rhs: Node) {
        
    }
}*/








