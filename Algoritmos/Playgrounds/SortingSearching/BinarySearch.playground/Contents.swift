import UIKit

extension Array where Element == Int {
    // Time Complexity: O(log n)
    // Auxiliary Space: O(log n)
    func binarySearch1(element: Int) -> Int {
        return binarySearch1Util(left: 0, right: count - 1, element: element)
    }

    private func binarySearch1Util(left: Int, right: Int, element: Int) -> Int {
        if right >= left {
            let middle = 1 + (right - left) / 2

            if self[middle] == element {
                return middle
            }

            if self[middle] > element {
                return binarySearch1Util(left: left, right: middle - 1, element: element)
            }

            return binarySearch1Util(left: middle + 1, right: right, element: element)
        }

        return -1
    }

    // Time Complexity: O (log n)
    // Auxiliary Space: O (1)
    func binarySearch2(element: Int) -> Int {
        var low = 0
        var high = count - 1
        var middle: Int

        while high - low > 1 {
            middle = (high - low) / 2

            if self[middle] < element {
                low = middle + 1
            } else {
                high = middle
            }
        }

        if self[low] == element {
            return low
        } else if self[high] == element {
            return high
        } else {
            return -1
        }
    }
}

var array = [2, 3, 4, 10, 40]
var element = 10

var result = array.binarySearch1(element: element)

print(result)
print("Output should be: 3\n")

array = [1, 3, 4, 5, 6];
element = 1
result = array.binarySearch2(element: element)

print(result)
print("Output should be: 0\n")

element = 6
result = array.binarySearch2(element: element)

print(result)
print("Output should be: 4\n")

element = 10
result = array.binarySearch2(element: element)

print(result)
print("Output should be: -1\n")
