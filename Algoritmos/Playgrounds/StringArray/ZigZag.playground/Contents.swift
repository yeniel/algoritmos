import UIKit

extension Array where Element: Comparable {
    // Time complexity: O(N*log(N)) because sorting is used.
    // Auxiliary Space: O(1)
    mutating func zigZag() {
        sort()

        for i in stride(from: 1, through: count - 2, by: 2) {
            swap(index1: i, index2: i + 1)
        }
    }

    // Time complexity: O(N)
    // Auxiliary Space: O(1)
    mutating func zigZag2() {
        var flag = true

        for i in 0...count - 2 {
            if flag {
                if self[i] > self[i + 1] {
                    swap(index1: i, index2: i + 1)
                }
            } else {
                if self[i] < self[i + 1] {
                    swap(index1: i, index2: i + 1)
                }
            }

            flag = !flag
        }
    }

    mutating private func swap(index1: Int, index2: Int) {
        var temp = self[index1]

        self[index1] = self[index2]
        self[index2] = temp
    }
}

var array: [Int]

array = [4, 3, 7, 8, 6, 2, 1]
array.zigZag()
print(array)
print("Output should be: [1, 3, 2, 6, 4, 8, 7]\n")

array = [4, 3, 7, 8, 6, 2, 1]
array.zigZag2()
print(array)
print("Output should be: [3, 7, 4, 8, 2, 6, 1]")
