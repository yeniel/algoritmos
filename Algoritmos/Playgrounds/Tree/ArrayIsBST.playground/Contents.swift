import UIKit

extension Array where Element == Int {
    // Time Complexity: O(n)
    // Auxiliary Space: O(n)
    func isBST() -> Bool {
        var stack: [Int] = []
        var root = Int.min

        for i in 0..<count {
            if self[i] < root {
                return false
            }

            while let last = stack.last, last < self[i] {
                root = last
                stack.popLast()
            }

            stack.append(self[i])
        }

        return true
    }
}

var array: [Int]
var result: Bool

array = [40, 30, 35, 80, 100]
result = array.isBST()
print(result)
print("Output should be: true\n")

array = [40, 30, 35, 20, 80, 100]
result = array.isBST()
print(result)
print("Output should be: false")
