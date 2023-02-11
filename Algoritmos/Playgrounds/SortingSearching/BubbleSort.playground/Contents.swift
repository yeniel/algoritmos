import UIKit

extension Array where Element == Int {
    // Time Complexity: O(N2)
    // Auxiliary Space: O(1)
    mutating func bubbleSort() {
        for i in 0..<count - 1 {
            for j in 0..<count - i - 1 {
                if self[j] > self[j + 1] {
                    swap(index1: j, index2: j + 1)
                }
            }
        }
    }

    // Time Complexity: O(N2)
    // Auxiliary Space: O(1)
    mutating func bubbleSort2() {
        var swapped: Bool

        for i in 0..<count - 1 {
            swapped = false

            for j in 0..<count - i - 1 {
                if self[j] > self[j + 1] {
                    swap(index1: j, index2: j + 1)
                    swapped = true
                }
            }

            if !swapped {
                break
            }
        }
    }

    mutating private func swap(index1: Int, index2: Int) {
        var temp = self[index1]

        self[index1] = self[index2]
        self[index2] = temp
    }
}

var array = [5, 1, 4, 2, 8]

array.bubbleSort()
print(array)
print("Output should be: [1, 2, 4, 5, 8]\n")

array = [5, 1, 4, 2, 8]
array.bubbleSort()
print(array)
print("Output should be: [1, 2, 4, 5, 8]")
