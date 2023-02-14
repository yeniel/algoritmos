import UIKit

extension Array where Element == Int {
    // Time Complexity of the above program is O(nlogn)
    // Space Complexity is O(1)
    func smallestSubsetSum() -> Int {
        var result = 1

        for element in self {
            if element <= result {
                result += element
            }
        }

        return result
    }
}

var array: [Int]
var result: Int

array = [1, 3, 4, 5]
result = array.smallestSubsetSum()

print(result)
print("Output should be: 2\n")

array = [1, 2, 6, 10, 11, 15]
result = array.smallestSubsetSum()

print(result)
print("Output should be: 4\n")

array = [1, 1, 1, 1]
result = array.smallestSubsetSum()

print(result)
print("Output should be: 5\n")

array = [1, 1, 3, 4]
result = array.smallestSubsetSum()

print(result)
print("Output should be: 10\n")
