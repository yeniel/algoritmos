import UIKit

extension Array where Element == Int, Element: Comparable {
    // Time Complexity: O(log2(log2 n)) for the average case, and O(n) for the worst case
    // Auxiliary Space Complexity: O(1)
    func interpolationSearch(element: Element) -> Int {
        return interpolationSearchUtil(lowIndex: 0, highIndex: count - 1, element: element)
    }

    private func interpolationSearchUtil(
        lowIndex: Int,
        highIndex: Int,
        element: Element
    ) -> Int {
        var pos: Int

        if lowIndex <= highIndex, element >= self[lowIndex], element <= self[highIndex] {
            pos = lowIndex
                + Int(floor(
                    Double(highIndex - lowIndex) / Double(self[highIndex] - self[lowIndex])
                    * Double(element - self[lowIndex])
                ))

            if self[pos] == element {
                return pos
            }

            if self[pos] < element {
                return interpolationSearchUtil(
                    lowIndex: pos + 1,
                    highIndex: highIndex,
                    element: element
                )
            }

            if self[pos] > element {
                return interpolationSearchUtil(
                    lowIndex: lowIndex,
                    highIndex: pos - 1,
                    element: element
                )
            }
        }

        return -1
    }
}

var array: [Int]
var result: Int
var element: Int

array = [10, 12, 13, 16, 18, 19, 20, 21, 22, 23, 24, 33, 35, 42, 47]
element = 18
result = array.interpolationSearch(element: element)

print(result)
print("Output should be: 5")

