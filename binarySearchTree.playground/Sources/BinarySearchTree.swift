import Foundation

public struct BinarySearchTree<Element: Comparable> {
    
    public private(set) var root: BinaryNode<Element>?
    
    public init() {}
}

extension BinarySearchTree: CustomStringConvertible {
    
    public var description: String {
        guard let root = root else { return "empty tree" }
        return String(describing: root)
    }
}


extension BinarySearchTree {
    
    public mutating func insert(_ value: Element) {
        root = insert(from: root, value: value)
    }
    
    // Implementation of insert
    private func insert(from node: BinaryNode<Element>?, value: Element) -> BinaryNode<Element> {
        // Base case
        guard let node = node else {
            return BinaryNode(value: value)
        }
        // Comparison to determine the place the new node will be inserted
        if value < node.value {
            node.leftChild = insert(from: node.leftChild, value: value)
        } else {
            node.rightChild = insert(from: node.rightChild, value: value)
        }
        
        return node
    }
    
    // Traversal O(logn)
    public func contains(_ value: Element) -> Bool {
        var current = root
        while let node = current {
            if node.value == value {
                return true
            }
            if value < node.value {
                current = node.leftChild
            } else {
                current = node.rightChild
            }
        }
        return false
    }
    
    public mutating func remove(_ value: Element) {
        root = remove(node: root, value: value)
    }
    
    private func remove(node: BinaryNode<Element>?, value: Element) -> BinaryNode<Element>? {
        guard let node = node else {
            return nil
        }
        if value == node.value {
            // If the node is leaf, just return nil
            if node.leftChild == nil && node.rightChild == nil {
                return nil
            }
            // If there is no left child, we returh right child to reconnect the tree
            if node.leftChild == nil {
                return node.rightChild
            }
            if node.rightChild == nil {
                return node.leftChild
            }
            // In the case there are both children, swap the leftmost node of the right tree with the given node, then call remve to remove the desired node.
            node.value = node.rightChild!.min.value
            node.rightChild = remove(node: node.rightChild, value: node.value)
        } else if value < node.value {
            node.leftChild = remove(node: node.leftChild, value: value)
        } else {
            node.rightChild = remove(node: node.rightChild, value: value)
        }
        return node
    }
}


