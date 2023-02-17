import UIKit

extension Array where Element == Int {
    // Time Complexity: O(n2).
    // Auxiliary Space: O(1)
    func smallestSubsetOfSum(sum: Int) -> Int {
        var result = count + 1

        for start in 0..<count {
            var currentSum = self[start]

            if currentSum > sum {
                return 1
            }

            for end in start + 1..<count {
                currentSum += self[end]

                if currentSum > sum, (end - start + 1) < result {
                    result = end - start + 1
                }
            }
        }

        return result
    }

    // Time Complexity: O(n).
    // Auxiliary Space: O(1)
    func smallestSubsetOfSum2(sum: Int) -> Int {
        var result = count + 1
        var currentSum = 0
        var start = 0
        var end = 0

        while end < count {
            while currentSum <= sum, end < count {
                currentSum += self[end]
                end += 1
            }

            while currentSum > sum, start < count {
                if end - start < result {
                    result = end - start
                }

                currentSum -= self[start]
                start += 1
            }
        }

        return result
    }
}

var array: [Int]
var sum: Int
var result: Int

array = [1, 4, 45, 6, 10, 19]
sum = 51
result = array.smallestSubsetOfSum(sum: sum)
print(result)
print("Output should be: 3\n")

array = [1, 10, 5, 2, 7]
sum = 9
result = array.smallestSubsetOfSum(sum: sum)
print(result)
print("Output should be: 1\n")

array = [1, 11, 100, 1, 0, 200, 3, 2, 1, 250]
sum = 280
result = array.smallestSubsetOfSum(sum: sum)
print(result)
print("Output should be: 4\n")
