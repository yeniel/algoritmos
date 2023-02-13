import UIKit

extension Array where Element: Comparable {
    // Time Complexity: O(N log N)
    // Auxiliary Space: O(1)
    mutating func heapSort() {
        for i in stride(from: (count / 2) - 1, through: 0, by: -1) {
            heapify(heapCount: count, index: i)
        }

        for i in stride(from: count - 1, through: 1, by: -1) {
            swap(index1: 0, index2: i)
            heapify(heapCount: i, index: 0)
        }
    }

    mutating private func heapify(heapCount: Int, index: Int) {
        var largest = index
        var leftIndex = 2 * index + 1
        var rightIndex = 2 * index + 2

        if leftIndex < heapCount, self[leftIndex] > self[largest] {
            largest = leftIndex
        }

        if rightIndex < heapCount, self[rightIndex] > self[largest] {
            largest = rightIndex
        }

        if largest != index {
            swap(index1: index, index2: largest)
            heapify(heapCount: heapCount, index: largest)
        }
    }

    mutating private func swap(index1: Int, index2: Int) {
        var temp = self[index1]

        self[index1] = self[index2]
        self[index2] = temp
    }
}

var array = [12, 11, 13, 5, 6, 7]

array.heapSort()
print(array)
print("Output should be: [5, 6, 7, 11, 12, 13]")
