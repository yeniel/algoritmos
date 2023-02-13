import UIKit

extension Array where Element == Int, Element: Comparable {
    // Time complexity of this method is O(n2).
    // Auxiliary Space: O(1)
    func isPythagoreanTriplet() -> Bool {
        var array = Array(self)

        for i in 0..<array.count {
            array[i] = array[i] * array[i]
        }

        array.sort()

        for i in stride(from: count - 1, through: 2, by: -1) {
            var leftIndex = 0
            var rightIndex = i - 1

            while leftIndex < rightIndex {
                if array[leftIndex] + array[rightIndex] == array[i] {
                    return true
                }

                if array[leftIndex] + array[rightIndex] < array[i] {
                    leftIndex += 1
                } else {
                    rightIndex -= 1
                }
            }
        }

        return false
    }

    // Time Complexity: O(n2)
    // Auxiliary Space: O(n)
    func isPythagoreanTriplet2() -> Bool {
        let maximum: Int = self.max() ?? count
        var hash = Array(repeating: 0, count: maximum + 1)

        for i in 0..<count {
            hash[self[i]] = hash[self[i]] + 1
        }

        for i in 1...maximum {
            if hash[i] == 0 {
                continue
            }

            for j in 1...maximum {
                if ((i == j && hash[j] == 1) || hash[j] == 0) {
                    continue
                }

                var value = Int(sqrt(Double(i * i + j * j)))

                if value * value != i * i + j * j {
                    continue
                }

                if value > maximum {
                    continue
                }

                if hash[value] == 1 {
                    return true
                }
            }
        }

        return false
    }
}

var array: [Int]
var result: Bool

array = [3, 1, 4, 6, 5]
result = array.isPythagoreanTriplet()

print(result)
print("Output should be: true\n")

array = [3, 2, 4, 6, 5]
result = array.isPythagoreanTriplet2()

print(result)
print("Output should be: true")

