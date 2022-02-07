import Foundation

public func mergeSort<Element>(_ array: inout [Element]) -> [Element] where Element: Comparable {

    var partSize = 1
    let n = array.count
    
    while (partSize < n) {
        var leftIndex = 0
        
        while (leftIndex <= n) {
            let rightIndex = min(leftIndex + (partSize*2 - 1), n - 1)
            var middle = (leftIndex + rightIndex) / 2
            
            // Handle size that is NOT power of 2
            if (partSize > n / 2) {
                middle = rightIndex - (n % partSize)
            }
            
            let left = Array(array[..<middle])
            let right = Array(array[middle...])
            array = merge(left, right)
            leftIndex += partSize * 2
        }
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


var array = [10, 7, 0, 3, 8]
print("Merge sorted!: \(mergeSort(&array))")
