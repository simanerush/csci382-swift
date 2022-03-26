import Foundation

// Testing example of unbalanced tree
var bst = BinarySearchTree<Int>()
for i in 0..<5 {
    bst.insert(i)
}
print(bst)

// Testing example of a balanced tree
var balancedTree = BinarySearchTree<Int>()
balancedTree.insert(3)
balancedTree.insert(1)
balancedTree.insert(4)
balancedTree.insert(0)
balancedTree.insert(2)
balancedTree.insert(5)
print(balancedTree)

// Finding a node
if balancedTree.contains(5) {
    print("Found 5!")
} else {
    print("No 5 in the tree")
}

// Removing a node
print("Tree before removal:")
print(balancedTree)
balancedTree.remove(3)
print("Tree after removing root:")
print(balancedTree)
