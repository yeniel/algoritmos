import UIKit

extension Array where Element: Comparable {
    // Time Complexity: O(log N) Binary Search requires log n comparisons to find the element.
    // Auxiliary Complexity: O(1)
    func pivotedBinarySearch1(element: Element) -> Int {
        let pivot = findPivot(low: 0, high: count - 1)

        if pivot == -1 {
            return binarySearch(low: 0, high: count - 1, element: element)
        }

        if self[pivot] == element {
            return pivot
        }

        if self[0] <= element {
            return binarySearch(low: 0, high: pivot - 1, element: element)
        }

        return binarySearch(low: pivot + 1, high: count - 1, element: element)
    }

    private func binarySearch(low: Int, high: Int, element: Element) -> Int {
        if high < low {
            return -1
        }

        let middle = (low + high) / 2

        if self[middle] == element {
            return middle
        }

        if self[middle] < element {
            return binarySearch(low: middle + 1, high: high, element: element)
        }

        return binarySearch(low: low, high: middle - 1, element: element)
    }

    private func findPivot(low: Int, high: Int) -> Int {
        if high < low {
            return -1
        }

        if high == low {
            return low
        }

        let middle = (low + high) / 2

        if middle < high, self[middle] > self[middle + 1] {
            return middle
        }

        if middle > low, self[middle] < self[middle - 1] {
            return middle - 1
        }

        if self[low] >= self[middle] {
            return findPivot(low: low, high: middle - 1)
        }

        return findPivot(low: middle + 1, high: high)
    }

    // Time Complexity: O(log N). Binary Search requires log n comparisons to find the element. So time complexity is O(log n).
    // Auxiliary Space: O(1). As no extra space is required.
    func pivotedBinarySearch2(low: Int, high: Int, element: Element) -> Int {
        if low > high {
            return -1
        }

        let middle = (low + high) / 2

        if self[middle] == element {
            return middle
        }

        if self[low] <= self[middle] {
            if element >= self[low], element <= self[middle] {
                return pivotedBinarySearch2(low: low, high: middle - 1, element: element)
            }

            return pivotedBinarySearch2(low: middle + 1, high: high, element: element)
        }

        if element >= self[middle], element <= self[high] {
            return pivotedBinarySearch2(low: middle + 1, high: high, element: element)
        }

        return pivotedBinarySearch2(low: low, high: middle - 1, element: element)
    }
}

var array: [Int]
var element: Int = 3
var result: Int

array = [5, 6, 7, 8, 9, 10, 1, 2, 3]
result = array.pivotedBinarySearch1(element: element)

print(result)
print("Output should be: 8\n")

array = [4, 5, 6, 7, 8, 9, 1, 2, 3]
result = array.pivotedBinarySearch2(low: 0, high: array.count - 1, element: element)

print(result)
print("Output should be: 8")

