import UIKit

extension Array where Element: Comparable {
    // Time Complexity: O(N^2)
    // Auxiliary Space: O(1)
    mutating func insertionSort() {
        var j: Int
        var key: Element

        for i in 1..<count {
            key = self[i]
            j = i - 1

            while j >= 0, self[j] > key {
                self[j + 1] = self[j]
                j -= 1
            }

            self[j + 1] = key
        }
    }
}

var array = [12, 11, 13, 5, 6 ]

array.insertionSort()
print(array)
print("Output should be: [5, 6, 11, 12, 13]")

