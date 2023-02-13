import UIKit

extension Array where Element: Comparable {
    // Time Complexity
    // Best case O(nlogn)
    // Average case O(nlogn)
    // Worst case O(n2)
    mutating func quickSort() {
        quickSortUtil(lowIndex: 0, highIndex: count - 1)
    }

    mutating private func quickSortUtil(lowIndex: Int, highIndex: Int) {
        if lowIndex < highIndex {
            let partioningIndex = quickPartition(lowIndex: lowIndex, highIndex: highIndex)

            quickSortUtil(lowIndex: lowIndex, highIndex: partioningIndex - 1)
            quickSortUtil(lowIndex: partioningIndex + 1, highIndex: highIndex)
        }
    }

    mutating private func quickPartition(lowIndex: Int, highIndex: Int) -> Int {
        let pivot = self[highIndex]
        var i = lowIndex - 1

        for j in lowIndex...highIndex {
            if self[j] < pivot {
                i += 1
                swap(index1: i, index2: j)
            }
        }

        swap(index1: i + 1, index2: highIndex)

        return i + 1
    }

    mutating private func swap(index1: Int, index2: Int) {
        var temp = self[index1]

        self[index1] = self[index2]
        self[index2] = temp
    }
}

var array: [Int]

array = [10, 7, 8, 9, 1, 5]
array.quickSort()
print(array)
print("Output should be: [1, 5, 7, 8, 9, 10]")
