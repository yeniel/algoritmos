import UIKit

// Time Complexity: O(2^n)
// Space Complexity: O(n)
func minimumPartition1(array: [Int]) -> Int {
    let sumTotal = array.reduce(0, +)

    return minimumPartition1Util(array: array, sumCalculated: 0, sumTotal: sumTotal)
}

func minimumPartition1Util(array: [Int], sumCalculated: Int, sumTotal: Int) -> Int {
    if array.count == 0 {
        return abs((sumTotal - sumCalculated) - sumCalculated)
    }

    let included = minimumPartition1Util(
        array: array.dropLast(),
        sumCalculated: sumCalculated + (array.last ?? 0),
        sumTotal: sumTotal
    )
    let notIncluded = minimumPartition1Util(
        array: array.dropLast(),
        sumCalculated: sumCalculated,
        sumTotal: sumTotal
    )

    return min(included, notIncluded)
}

// Time Complexity = O(n*sum) where n is the number of elements and sum is the sum of all elements.
// Auxiliary Space: O(n*sum)
func minimumPartition2(array: [Int]) -> Int {
    let sum = array.reduce(0, +)
    let count = array.count
    var dp = Array(repeating: Array(repeating: true, count: sum + 1), count: count + 1)

    for i in 1...sum {
        dp[0][i] = false
    }

    for i in 1...count {
        for j in 1...sum {
            dp[i][j] = dp[i - 1][j]

            if array[i - 1] <= j {
                dp[i][j] = dp[i][j] || dp[i - 1][j - array[i - 1]]
            }
        }
    }

    var diff = Int.max

    for j in stride(from: sum / 2, through: 0, by: -1) {
        if dp[count][j] {
            diff = sum - (2 * j)
            break
        }
    }

    return diff
}

// Time Complexity: O(n*sum)
// Auxiliary Space: O(sum)
func minimumPartition3(array: [Int]) -> Int {
    let count = array.count
    var sum = array.reduce(0, +)
    let y = (sum / 2) + 1
    var dp = Array(repeating: false, count: y)
    var dd = Array(repeating: false, count: y)

    dp[0] = true

    for i in 0..<count {
        var j = 0

        while j + array[i] < y {
            if dp[j] {
                dd[j + array[i]] = true
            }

            j += 1
        }

        for j in 0..<y {
            if dd[j] {
                dp[j] = true
            }

            dd[j] = false
        }
    }

    for i in stride(from: y - 1, through: 0, by: -1) {
        if dp[i] {
            return sum - 2 * i
        }
    }

    return 0
}

var array = [3, 1, 4, 2, 2, 1]
var result = minimumPartition1(array: array)

print(result)
print("Output should be: 1\n")

result = minimumPartition2(array: array)

print(result)
print("Output should be: 1\n")

array = [1, 6, 11, 5]
result = minimumPartition3(array: array)

print(result)
print("Output should be: 1\n")
