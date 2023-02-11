import UIKit

extension Array where Element == Int {
    // Time Complexity: O(n3)
    // Auxiliary Space: O(1)
    func tripletsSum(sum: Int) -> Int {
        var result = 0

        for i in 0..<count - 2 {
            for j in i + 1..<count - 1 {
                for k in j + 1..<count {
                    if self[i] + self[j] + self[k] < sum {
                        result += 1
                    }
                }
            }
        }

        return result
    }

    mutating func tripletsSum2(sum: Int) -> Int {
        var result = 0

        self.sort()

        for i in 0..<count - 2 {
            var j = i + 1
            var k = count - 1

            while j < k {
                if self[i] + self[j] + self[k] >= sum {
                    k -= 1
                } else {
                    result += k - j
                    j += 1
                }
            }
        }

        return result
    }
}

var array: [Int]
var sum: Int
var result: Int

array = [5, 1, 3, 4, 7]
sum = 12
result = array.tripletsSum(sum: sum)
print(result)
print("Output should be: 4\n")

result = array.tripletsSum2(sum: sum)
print(result)
print("Output should be: 4\n")
