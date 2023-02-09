import UIKit

func longestPathFromCell(matrix: [[Int]], i: Int, j: Int, dp: inout [[Int]]) -> Int {
    let count = matrix.count

    if i < 0 || i >= count || j < 0 || j >= count {
        return 0
    }

    if dp[i][j] != -1 {
        return dp[i][j]
    }

    var x = -1
    var y = -1
    var z = -1
    var w = -1

    if j < count - 1, matrix[i][j] + 1 == matrix[i][j + 1] {
        x = 1 + longestPathFromCell(matrix: matrix, i: i, j: j + 1, dp: &dp)
    }

    if j > 0, matrix[i][j] + 1 == matrix[i][j - 1] {
        x = 1 + longestPathFromCell(matrix: matrix, i: i, j: j - 1, dp: &dp)
    }

    if i > 0, matrix[i][j] + 1 == matrix[i - 1][j] {
        x = 1 + longestPathFromCell(matrix: matrix, i: i - 1, j: j, dp: &dp)
    }

    if i < count - 1, matrix[i][j] + 1 == matrix[i + 1][j] {
        x = 1 + longestPathFromCell(matrix: matrix, i: i + 1, j: j, dp: &dp)
    }

    dp[i][j] = max(x, max(y, max(z, max(w, 1))))

    return dp[i][j]
}

func longestPath(matrix: [[Int]]) -> Int {
    let count = matrix.count
    var result = 1
    var dp = Array(repeating: Array(repeating: -1, count: count), count: count)

    for i in 0..<count {
        for j in 0..<count {
            if dp[i][j] == -1 {
                longestPathFromCell(matrix: matrix, i: i, j: j, dp: &dp)
            }

            result = max(result, dp[i][j])
        }
    }

    return result
}

let matrix = [[ 1, 2, 9 ],
              [ 5, 3, 8 ],
              [ 4, 6, 7 ]]

let pathCount = longestPath(matrix: matrix)

print(pathCount)
print("Output should be: 4")
