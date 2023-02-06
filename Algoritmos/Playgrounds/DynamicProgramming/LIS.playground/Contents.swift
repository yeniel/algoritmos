import UIKit

// Time Complexity: The time complexity of this recursive approach is exponential as there is a case of overlapping subproblems as explained in the recursive tree diagram above.
// Auxiliary Space: O(1). No external space used for storing values apart from the internal stack space.
func lis1(array: [Int]) -> Int {
    var result = 1

    list1Util(array: array, result: &result)

    return result
}

@discardableResult
func list1Util(array: [Int], result: inout Int) -> Int {
    if array.count <= 1 {
        return array.count
    }

    var currentResult: Int
    var maxEndingHere = 1

    for index in 1..<array.count {
        currentResult = list1Util(array: Array(array[..<index]), result: &result)

        if array[index - 1] < array[array.count - 1], currentResult + 1 > maxEndingHere {
            maxEndingHere = currentResult + 1
        }
    }

    if result < maxEndingHere {
        result = maxEndingHere
    }

    return maxEndingHere
}

// Time Complexity: O(n2). As nested loop is used.
// Auxiliary Space: O(n). Use of any array to store LIS values at each index.
func lis2(array: [Int]) -> Int {
    var lis = Array(repeating: 1, count: array.count)
    var max = 0

    lis[0] = 1

    for i in 1..<array.count {
        lis[i] = 1

        for j in 0..<i {
            if array[i] > array[j], lis[i] < lis[j] + 1 {
                lis[i] = lis[j] + 1
            }
        }
    }

    for i in 0..<array.count {
        if max < lis[i] {
            max = lis[i]
        }
    }

    return max
}

// Complexity Analysis : O(n*n) As nested loop is used
// Space Complexity : O(n*n) As a matrix is used for storing the values.
func lis3(array: [Int]) -> Int {
    let sortedArray = array.sorted()
    var dp = Array(repeating: Array(repeating: -1, count: array.count + 1), count: array.count + 1)

    for i in 0...array.count {
        for j in 0...array.count {
            if i == 0 || j == 0 {
                dp[i][j] = 0
            } else if array[i - 1] == sortedArray[j - 1] {
                dp[i][j]  = 1 + dp[i - 1][j - 1]
            } else {
                dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
            }
        }
    }

    return dp[array.count][array.count]
}

// Time Complexity: O(n2).
// Auxiliary Space: O(n2).
func lis4(array: [Int]) -> Int {
    var dp = buildDP(xCount: array.count, yCount: array.count, initial: -1)

    return lis4Util(index: 0, previousIndex: -1, array: array, dp: &dp)
}

func lis4Util(index: Int, previousIndex: Int, array: [Int], dp: inout [[Int]]) -> Int {
    if index == array.count {
        return 0
    }

    if dp[index][previousIndex + 1] != -1 {
        return dp[index][previousIndex + 1]
    }

    var notTake = 0 + lis4Util(
        index: index + 1,
        previousIndex: previousIndex,
        array: array,
        dp: &dp
    )
    var take = Int.min

    if previousIndex == -1 || array[index] > array[previousIndex] {
        take = 1 + lis4Util(index: index + 1, previousIndex: index, array: array, dp: &dp)
    }

    dp[index][previousIndex + 1] = max(take, notTake)

    return dp[index][previousIndex + 1]
}

var lis: Int
let array = [10, 22, 9, 33, 21, 50, 41, 60]

lis = lis1(array: array)
print(lis)
print("Output should be: 5\n")

lis = lis2(array: array)
print(lis)
print("Output should be: 5\n")

lis = lis3(array: array)
print(lis)
print("Output should be: 5\n")

lis = lis4(array: array)
print(lis)
print("Output should be: 5")
