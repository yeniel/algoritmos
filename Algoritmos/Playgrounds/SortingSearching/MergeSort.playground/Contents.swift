import UIKit

extension Array where Element: Comparable {
    // Time Complexity: O(N log(N)),  Sorting arrays on different machines. Merge Sort is a recursive algorithm and time complexity can be expressed as following recurrence relation.
    // Auxiliary Space: O(n), In merge sort all elements are copied into an auxiliary array. So N auxiliary space is required for merge sort.
    mutating func mergeSort() {
        mergeSortUtil(leftIndex: 0, rightIndex: count - 1)
    }

    mutating private func mergeSortUtil(leftIndex: Int, rightIndex: Int) {
        if leftIndex >= rightIndex {
            return
        }

        let middleIndex = leftIndex + (rightIndex - leftIndex) / 2

        mergeSortUtil(leftIndex: leftIndex, rightIndex: middleIndex)
        mergeSortUtil(leftIndex: middleIndex + 1, rightIndex: rightIndex)
        mergeSortMerge(leftIndex: leftIndex, middleIndex: middleIndex, rightIndex: rightIndex)
    }

    mutating private func mergeSortMerge(leftIndex: Int, middleIndex: Int, rightIndex: Int) {
        let count1 = middleIndex - leftIndex + 1
        let count2 = rightIndex - middleIndex

        var L: [Element] = Array(self[leftIndex..<(leftIndex + count1)])
        var R: [Element] = Array(self[(middleIndex + 1)..<(middleIndex + 1 + count2)])

        var firstSubarrayIndex = 0
        var secondSubarrayIndex = 0
        var mergedSubarrayIndex = leftIndex

        while firstSubarrayIndex < count1, secondSubarrayIndex < count2 {
            if L[firstSubarrayIndex] <= R[secondSubarrayIndex] {
                self[mergedSubarrayIndex] = L[firstSubarrayIndex]
                firstSubarrayIndex += 1
            } else {
                self[mergedSubarrayIndex] = R[secondSubarrayIndex]
                secondSubarrayIndex += 1
            }

            mergedSubarrayIndex += 1
        }

        while firstSubarrayIndex < count1 {
            self[mergedSubarrayIndex] = L[firstSubarrayIndex]
            firstSubarrayIndex += 1
            mergedSubarrayIndex += 1
        }

        while secondSubarrayIndex < count2 {
            self[mergedSubarrayIndex] = R[secondSubarrayIndex]
            secondSubarrayIndex += 1
            mergedSubarrayIndex += 1
        }
    }
}

var array: [Int]

array = [12, 11, 13, 5, 6, 7]
array.mergeSort()
print(array)
print("Output should be: [5, 6, 7, 11, 12, 13]")
