import UIKit

extension Array where Element == Int {
    // Time Complexity:- O(N^2)
    // Space Complexity:- O(1)
    func closestPairSum(element: Element) -> (Int, Int) {
        var pair: (Int, Int) = (0, 0)
        var diff = Int.max

        for i in 0..<count - 1 {
            for j in i + 1..<count {
                if abs(self[i] + self[j] - element) < diff {
                    pair = (self[i], self[j])
                    diff = abs(self[i] + self[j] - element)
                }
            }
        }

        return pair
    }

    // Time Complexity: O(n), where n is the length of an Array.
    // Auxiliary Space: O(1)
    func closestPairSum2(element: Element) -> (Int, Int) {
        var pair: (Int, Int) = (0, 0)
        var leftIndex = 0
        var rightIndex = count - 1
        var diff = Int.max

        while rightIndex > leftIndex {
            if abs(self[leftIndex]) + self[rightIndex] - element < diff {
                pair = (self[leftIndex], self[rightIndex])
                diff = abs(self[leftIndex] + self[rightIndex] - element)
            }

            if self[leftIndex] + self[rightIndex] > element {
                rightIndex -= 1
            } else {
                leftIndex += 1
            }
        }

        return pair
    }
}

var array: [Int]
var element: Int
var result: (Int, Int)

array = [10, 22, 28, 29, 30, 40]
element = 54
result = array.closestPairSum(element: element)
print(result)
print("Output should be: (22, 30)\n")

array = [10, 22, 28, 29, 30, 40]
element = 54
result = array.closestPairSum2(element: element)
print(result)
print("Output should be: (22, 30)\n")
