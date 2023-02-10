import UIKit

// Time Complexity: O(log n)
// Auxiliary Space: O(log n)
func binarySearch1(array: [Int], element: Int) -> Int {
    return binarySearch1Util(array: array, left: 0, right: array.count - 1, element: element)
}

func binarySearch1Util(array: [Int], left: Int, right: Int, element: Int) -> Int {
    if right >= left {
        let middle = 1 + (right - left) / 2

        if array[middle] == element {
            return middle
        }

        if array[middle] > element {
            return binarySearch1Util(array: array, left: left, right: middle - 1, element: element)
        }

        return binarySearch1Util(array: array, left: middle + 1, right: right, element: element)
    }

    return -1
}

// Time Complexity: O (log n)
// Auxiliary Space: O (1)
func binarySearch2(array: [Int], element: Int) -> Int {
    var low = 0
    var high = array.count - 1
    var middle: Int

    while high - low > 1 {
        middle = (high - low) / 2

        if array[middle] < element {
            low = middle + 1
        } else {
            high = middle
        }
    }

    if array[low] == element {
        return low
    } else if array[high] == element {
        return high
    } else {
        return -1
    }
}

var array = [2, 3, 4, 10, 40]
var element = 10

var result = binarySearch1(array: array, element: element)

print(result)
print("Output should be: 3\n")

array = [1, 3, 4, 5, 6];
element = 1
result = binarySearch2(array: array, element: element)

print(result)
print("Output should be: 0\n")

element = 6
result = binarySearch2(array: array, element: element)

print(result)
print("Output should be: 4\n")

element = 10
result = binarySearch2(array: array, element: element)

print(result)
print("Output should be: -1\n")
