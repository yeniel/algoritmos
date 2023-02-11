import UIKit

// Time Complexity: O(log N) Binary Search requires log n comparisons to find the element.
// Auxiliary Complexity: O(1)
func pivotedBinarySearch1(array: [Int], key: Int) -> Int {
    let count = array.count
    let pivot = findPivot(array: array, low: 0, high: count - 1)

    if pivot == -1 {
        return binarySearch(array: array, low: 0, high: count - 1, element: key)
    }

    if array[pivot] == key {
        return pivot
    }

    if array[0] <= key {
        return binarySearch(array: array, low: 0, high: pivot - 1, element: key)
    }

    return binarySearch(array: array, low: pivot + 1, high: count - 1, element: key)
}

func binarySearch(array: [Int], low: Int, high: Int, element: Int) -> Int {
    if high < low {
        return -1
    }

    let middle = (low + high) / 2

    if array[middle] == element {
        return middle
    }

    if array[middle] < element {
        return binarySearch(array: array, low: middle + 1, high: high, element: element)
    }

    return binarySearch(array: array, low: low, high: middle - 1, element: element)
}

func findPivot(array: [Int], low: Int, high: Int) -> Int {
    if high < low {
        return -1
    }

    if high == low {
        return low
    }

    let middle = (low + high) / 2

    if middle < high, array[middle] > array[middle + 1] {
        return middle
    }

    if middle > low, array[middle] < array[middle - 1] {
        return middle - 1
    }

    if array[low] >= array[middle] {
        return findPivot(array: array, low: low, high: middle - 1)
    }

    return findPivot(array: array, low: middle + 1, high: high)
}

// Time Complexity: O(log N). Binary Search requires log n comparisons to find the element. So time complexity is O(log n).
// Auxiliary Space: O(1). As no extra space is required.
func pivotedBinarySearch2(array: [Int], low: Int, high: Int, key: Int) -> Int {
    if low > high {
        return -1
    }

    let middle = (low + high) / 2

    if array[middle] == key {
        return middle
    }

    if array[low] <= array[middle] {
        if key >= array[low], key <= array[middle] {
            return pivotedBinarySearch2(array: array, low: low, high: middle - 1, key: key)
        }

        return pivotedBinarySearch2(array: array, low: middle + 1, high: high, key: key)
    }

    if key >= array[middle], key <= array[high] {
        return pivotedBinarySearch2(array: array, low: middle + 1, high: high, key: key)
    }

    return pivotedBinarySearch2(array: array, low: low, high: middle - 1, key: key)
}

var array = [5, 6, 7, 8, 9, 10, 1, 2, 3]
var key = 3

var result = pivotedBinarySearch1(array: array, key: key)

print(result)
print("Output should be: 8\n")

array = [4, 5, 6, 7, 8, 9, 1, 2, 3]
key = 3

result = pivotedBinarySearch2(array: array, low: 0, high: array.count - 1, key: key)
print(result)
print("Output should be: 8")

