import Foundation

public func mergeSort<Element>(_ array: [Element]) -> [Element] where Element: Comparable {
    
    // Check if it is reasonable to split further
    guard array.count > 1 else {
        return array
    }
    
    // Split the array into two halves
    let middle = array.count / 2
    let left = mergeSort(Array(array[..<middle]))
    let right = mergeSort(Array(array[middle...]))
    
    return merge(left, right)
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


let array = [3, 2, 9, 5, 0]
print("Merge sorted!: \(mergeSort(array))")
