import Foundation

public func mergeSort<Element>(_ array: inout [Element]) -> [Element] where Element: Comparable {

    var partSize = 1
    let n = array.count
    
    while (partSize < n) {
        // Start from the left-most elements
        var leftIndex = 0
        
        while (leftIndex <= n) {
            // Get the other end of partition
            let rightIndex = min(leftIndex + (partSize*2 - 1), n - 1)
            var middle = (leftIndex + rightIndex) / 2
            
            // Handle size that is NOT power of 2
            if (partSize > n / 2) {
                middle = rightIndex - (n % partSize)
            }
            
            // Get both parts of the array that will get merged
            let left = Array(array[..<middle])
            let right = Array(array[middle...])
            array = merge(left, right)
            // Move to the next partition
            leftIndex += partSize * 2
        }
        // Invrease the size of partition
        partSize *= 2
    }
    
    return array
}

private func merge<Element>(_ left: [Element], _ right: [Element]) -> [Element] where Element: Comparable {
    
    var leftIndex = 0
    var rightIndex = 0
    
    var result: [Element] = []
    
    // Comparing elements and inserting them in sorted order
    while leftIndex < left.count && rightIndex < right.count {
        let leftElement = left[leftIndex]
        let rightElement = right[rightIndex]
        
        if leftElement < rightElement {
            result.append(leftElement)
            leftIndex += 1
        } else if leftElement > rightElement {
            result.append(rightElement)
            rightIndex += 1
        } else {
            result.append(leftElement)
            leftIndex += 1
            result.append(rightElement)
            rightIndex += 1
        }
    }
    
    // Append the rest
    if leftIndex < left.count {
        result.append(contentsOf: left[leftIndex...])
    }
    
    if rightIndex < right.count {
        result.append(contentsOf: right[rightIndex...])
    }
    
    return result
}


var array1 = [10, 7, 0, 3, 8]
print("Merge sorted!: \(mergeSort(&array1))")
// Output: Merge sorted!: [0, 3, 7, 8, 10]

var array2 = [30, 7, 2, 10, 9]
print("Merge sorted!: \(mergeSort(&array2))")
// Output: Merge sorted!: [2, 7, 9, 10, 30]
