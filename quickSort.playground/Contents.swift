import Foundation

///  Median of Three

public func medianOfThree<T: Comparable>(_ a: inout [T], left: Int, right: Int) -> Int {
    let center = (left + right) / 2
    
    if a[left] > a[center] {
        a.swapAt(left, center)
    }
    if a[left] > a[right] {
        a.swapAt(left, right)
    }
    if a[center] > a[right] {
        a.swapAt(center, right)
    }
    
    return center
}
public func quicksort<T: Comparable>(_ a: inout [T], left: Int, right: Int) {
    if left < right {
        let p = medianOfThree(&a, left: left, right: right)
        a.swapAt(p, right)
        let m = partition(&a, right: right, left: left)
        quicksort(&a, left: left, right: m - 1)
        quicksort(&a, left: m + 1, right: right)
    }
}

public func partition<T: Comparable>(_ a: inout [T], right: Int, left: Int) -> Int {
    let p = a[right]
    
    var i = left
    for j in left..<right {
        if a[j] <= p {
            a.swapAt(i, j)
            i += 1
        }
    }
    
    a.swapAt(i, right)
    
    return i
}

public func threeWayPartition<T: Comparable>(_ a: inout [T], left: Int, right: Int, p: Int) -> (Int, Int) {
    let p = a[p]
    
    var smaller = left
    var equal = left
    var larger = right
    
    while equal <= larger {
        if a[equal] < p {
            a.swapAt(smaller, equal)
            smaller += 1
            equal += 1
        } else if a[equal] == p {
            equal += 1
        } else {
            a.swapAt(equal, larger)
            larger -= 1
        }
    }
    
    return (smaller, larger)
}


// MARK: - Tests
var list = [30, 2, 4, 7, 3, 8, 50, 1, -1, -4, 16, 20]
quicksort(&list, left: 0, right: list.count - 1)
print(list)
