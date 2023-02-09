import UIKit

// Time complexity: O(n^2), The time complexity of this approach is O(n^2) as we are using memoization to store the subproblem solutions which are calculated again and again.
// Auxiliary Space: O(n^2), The space complexity of this approach is O(n^2) as we are using a map of size n^2 to store the solutions of the subproblems.
func optimalStrategy1(array: [Int]) -> Int? {
    var memo: [[Int]: Int] = [:]

    return solve1(array: array, i: 0, j: array.count - 1, memo: &memo)
}

func solve1(array: [Int], i: Int, j: Int, memo: inout [[Int]: Int]) -> Int? {
    if i > j || i >= array.count || j < 0 {
        return 0
    }

    let k = [i, j]

    if memo.keys.contains(k) {
        return memo[k]
    }

    let choice1 = solve1(array: array, i: i + 2, j: j, memo: &memo)
    let choice2 = solve1(array: array, i: i + 1, j: j - 1, memo: &memo)
    let option1 = array[i] + min(choice1!, choice2!)

    let choice3 = solve1(array: array, i: i + 1, j: j - 1, memo: &memo)
    let choice4 = solve1(array: array, i: i, j: j - 2, memo: &memo)
    let option2 = array[j] + min(choice3!, choice4!)

    memo[k] = max(option1, option2)

    return memo[k]
}

// Time Complexity: O(N2).
// Auxiliary Space: O(N2). As a 2-D table is used for storing states.
func optimalStrategy2(array: [Int]) -> Int {
    var count = array.count
    var table = Array(repeating: Array(repeating: 0, count: count), count: count)
    var x: Int
    var y: Int
    var z: Int
    var i: Int

    for gap in 0..<count {
        i = 0

        for j in gap..<count {
            if i + 2 <= j {
                x = table[i + 2][j]
            } else {
                x = 0
            }

            if i + 1 < j - 1 {
                y = table[i + 1][j - 1]
            } else {
                y = 0
            }

            if i <= j - 2 {
                z = table[i][j - 2]
            } else {
                z = 0
            }

            table[i][j] = max(array[i] + min(x, y), array[j] + min(y, z))
            i += 1
        }
    }

    return table[0][count - 1]
}

var array = [8, 15, 3, 7]
var result = optimalStrategy1(array: array)

print(result ?? -1)
print("Output should be: 22\n")

array = [2, 2, 2, 2]
result = optimalStrategy1(array: array)
print(result ?? -1)
print("Output should be: 4\n")

array = [20, 30, 2, 2, 2, 10]
result = optimalStrategy1(array: array)
print(result ?? -1)
print("Output should be: 42\n")

array = [8, 15, 3, 7]
result = optimalStrategy2(array: array)
print(result ?? -1)
print("Output should be: 22\n")

array = [2, 2, 2, 2]
result = optimalStrategy2(array: array)
print(result ?? -1)
print("Output should be: 4\n")

array = [20, 30, 2, 2, 2, 10]
result = optimalStrategy2(array: array)
print(result ?? -1)
print("Output should be: 42\n")
