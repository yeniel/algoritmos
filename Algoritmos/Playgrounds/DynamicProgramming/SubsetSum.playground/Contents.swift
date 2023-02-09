import UIKit

// Complexity Analysis: The above solution may try all subsets of given set in worst case. Therefore time complexity of the above solution is exponential. The problem is in-fact NP-Complete (There is no known polynomial time solution for this problem).
func existSubSet1(array: [Int], withSum sum: Int) -> Bool {
    if sum == 0 {
        return true
    }

    if array.count == 0 {
        return false
    }

    guard let last = array.last else {
        return false
    }

    if last > sum {
        return existSubSet1(array: array.dropLast(), withSum: sum)
    }

    let includeLastElement = existSubSet1(array: array.dropLast(), withSum: sum)
    let excludeLastElement = existSubSet1(array: array.dropLast(), withSum: sum - last)

    return includeLastElement || excludeLastElement
}

// Time Complexity: O(sum*n), where sum is the ‘target sum’ and ‘n’ is the size of array.
// Auxiliary Space: O(sum*n), as the size of 2-D array is sum*n. + O(n) for recursive stack space
func existSubSet2(array: [Int], withSum sum: Int) -> Bool {
    var subset = Array(repeating: Array(repeating: false, count: sum + 1), count: sum + 1)

    for i in 0...array.count {
        subset[0][i] = true
    }

    for i in 1...sum {
        subset[i][0] = false
    }

    for i in 1...sum {
        for j in 1...array.count {
            subset[i][j] = subset[i][j - 1]

            if i >= array[j - 1] {
                subset[i][j] = subset[i][j] || subset[i - array[j - 1]][j - 1]
            }
        }
    }

    return subset[sum][array.count]
}

// Time Complexity: O(sum*n), where sum is the ‘target sum’ and ‘n’ is the size of array.
// Auxiliary Space: O(sum*n) + O(n) -> O(sum*n) = the size of 2-D array is sum*n and O(n)=auxiliary stack space.
func existSubSet3(array: [Int], withSum sum: Int, tab: inout [[Int]]) -> Bool {
    if sum == 0 {
        return true
    }

    if array.count <= 0 {
        return false
    }

    if tab[array.count - 1][sum] != -1 {
        return tab[array.count - 1][sum] == 1
    }

    guard let last = array.last else {
        return false
    }

    if last > sum {
        let value = existSubSet3(array: array.dropLast(), withSum: sum, tab: &tab)
        tab[array.count - 1][sum] = value ? 1 : 0

        return value
    } else {
        let value1 = existSubSet3(array: array.dropLast(), withSum: sum, tab: &tab)
        let value2 = existSubSet3(array: array.dropLast(), withSum: sum - last, tab: &tab)

        tab[array.count - 1][sum] = value1 || value2 ? 1 : 0

        return value1 || value2
    }
}

var array = [3, 34, 4, 12, 5, 2]

var sum = 9
var exist = existSubSet1(array: array, withSum: sum)

print(exist)
print("Output should be: true\n")

sum = 30
exist = existSubSet1(array: array, withSum: sum)
print(exist)
print("Output should be: false\n")

sum = 9
exist = existSubSet2(array: array, withSum: sum)
print(exist)
print("Output should be: true\n")

var tab = Array(repeating: Array(repeating: -1, count: 2000), count: 2000)
array = [1, 5, 3, 7, 4]
sum = 12
exist = existSubSet3(array: array, withSum: sum, tab: &tab)
print(exist)
print("Output should be: true")

