import Foundation

var tree: BinaryNode<Int> = {
    let eight = BinaryNode(value: 8)
    let six = BinaryNode(value: 6)
    let one = BinaryNode(value: 1)
    let five = BinaryNode(value: 5)
    let three = BinaryNode(value: 3)
    let two = BinaryNode(value: 2)
    let four = BinaryNode(value: 4)
    let seven = BinaryNode(value: 7)
    let nine = BinaryNode(value: 9)
    let twelve = BinaryNode(value: 12)
    let ten = BinaryNode(value: 10)
    let eleven = BinaryNode(value: 11)
    
    eight.leftChild = six
    six.leftChild = one
    one.rightChild = five
    five.leftChild = three
    three.leftChild = two
    three.rightChild = four
    six.rightChild = seven
    eight.rightChild = nine
    nine.rightChild = twelve
    twelve.leftChild = ten
    ten.rightChild = eleven
    
    return eight
}()

// Testing out the diagram
print(tree)
