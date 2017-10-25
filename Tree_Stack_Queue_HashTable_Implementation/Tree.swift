
import Foundation

class Tree <T> {
    
    // making a read only property in Swift
    private(set) var value: T

    init (initialValue: T) {
        
        value = initialValue
        
    }
    
    // making a read only property
    private(set) var childrenOfTree = [Tree]()
    
    
    func add( child: Tree ) {
        
        childrenOfTree.append(child)
        
    }
    
    func children() -> [Tree] {
        
        return childrenOfTree
        
    }
    
    // directly deletes all the tree except the root/parent tree
    func clear() {
        
        childrenOfTree.removeAll()
        
    }
    
    
    var height: Int {
        
        func subTreeHeight(tree: Tree) -> Int {
            
            if tree.isLeaf {    // base case
                
                return 1        // root of tree only does have a height of 1
                
            }
            
            var maxHeight: Int = 0
            
            for i in tree.childrenOfTree {
                
                let tempHeight = subTreeHeight(tree: i)
                
                if tempHeight > maxHeight {
                    
                    maxHeight = tempHeight
                    
                }
                
            }
            
            return maxHeight + 1    // using max(subTreeHeight) + 1 concept (wonderful)
            
        }
        
        return subTreeHeight(tree: self)
        
    }
    
    
    var isLeaf: Bool {
        
        return childrenOfTree.isEmpty
        
    }
    
    
    // printing tree
    func printTree() {
        
        func recursivePrinting (_ tree: Tree) {
            
            // base case
            if tree.isLeaf {
                
                print(tree.value)
                
                return
                
            }
            
            // looping through childre of tree
            for i in tree.children() {
                
                recursivePrinting(i)
                
            }
            
            print (tree.value) // needs to print the root too
            
        }
        
        // calling self to print it
        recursivePrinting(self)
    
    }
    
}
