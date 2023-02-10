import UIKit

// Time Complexity: O(n3), as we are using nested loops to traverse n3 times. Where n is the length of the symbols string.
// Auxiliary Space: O(n2), as we are using extra space for the DP matrix. Where n is the length of the symbols string.
func countParentheses1(symbols: [String], operators: [String]) -> Int {
    let count = symbols.count
    var F: [[Int]] = Array(repeating: Array(repeating: 0, count: count), count: count)
    var T: [[Int]] = Array(repeating: Array(repeating: 0, count: count), count: count)

    for i in 0..<count {
        F[i][i] = symbols[i] == "F" ? 1 : 0
        T[i][i] = symbols[i] == "T" ? 1 : 0
    }

    for gap in 1..<count {
        var i = 0

        for j in gap..<count {
            T[i][j] = 0
            F[i][j] = 0

            for g in 0..<gap {
                let k = i + g
                let tik = T[i][k] + F[i][k]
                let tkj = T[k + 1][j] + F[k + 1][j]

                if operators[k] == "&" {
                    T[i][j] += T[i][k] * T[k + 1][j]
                    F[i][j] += (tik * tkj) - (T[i][k] * T[k + 1][j])
                }

                if operators[k] == "|" {
                    F[i][j] += F[i][k] * F[k + 1][j]
                    T[i][j] += (tik * tkj) - (F[i][k] * F[k + 1][j])
                }

                if operators[k] == "^" {
                    T[i][j] += (F[i][k] * T[k + 1][j]) + (T[i][k] * F[k + 1][j])
                    F[i][j] += (T[i][k] * T[k + 1][j]) + (F[i][k] * F[k + 1][j])
                }
            }

            i += 1
        }
    }

    return T[0][count - 1]
}

// Time Complexity: O(n3), as we are using a loop to traverse, n times and we are making recursive calls which will cost n2 times. Where n is the length of the symbols string.
// Auxiliary Space: O(n2), as we are using extra space for the DP matrix. Where n is the length of the symbols string.
func countParentheses2(symbols: [String], operators: [String]) -> Int {
    var operation: [String] = []
    var j = 0

    for i in 0..<symbols.count {
        operation.append(symbols[i])

        if j < operators.count {
            operation.append(operators[j])
            j += 1
        }
    }

    var dp = Array(
        repeating: Array(repeating: [-1, -1], count: operation.count + 1),
        count: operation.count + 1
    )

    return countParentheses2Util(
        operation: operation,
        i: 0,
        j: operation.count - 1,
        isTrue: 1,
        dp: &dp
    )
}

func countParentheses2Util(operation: [String], i: Int, j: Int, isTrue: Int, dp: inout [[[Int]]]) -> Int {
    if i > j {
        return 0
    }

    if i == j {
        if isTrue == 1 {
            return operation[i] == "T" ? 1 : 0
        } else {
            return operation[i] == "F" ? 1 : 0
        }
    }

    if dp[i][j][isTrue] != -1 {
        return dp[i][j][isTrue]
    }

    var result = 0
    var leftTrue: Int
    var rightTrue: Int
    var leftFalse: Int
    var rightFalse: Int

    for k in stride(from: i + 1, through: j - 1, by: 2) {
        if dp[i][k - 1][1] != -1 {
            leftTrue = dp[i][k - 1][1]
        } else {
            leftTrue = countParentheses2Util(operation: operation, i: i, j: k - 1, isTrue: 1, dp: &dp)
        }

        if dp[i][k - 1][0] != -1 {
            leftFalse = dp[i][k - 1][0]
        } else {
            leftFalse = countParentheses2Util(operation: operation, i: i, j: k - 1, isTrue: 0, dp: &dp)
        }

        if dp[k + 1][j][1] != -1 {
            rightTrue = dp[k + 1][j][1]
        } else {
            rightTrue = countParentheses2Util(operation: operation, i: k + 1, j: j, isTrue: 1, dp: &dp)
        }

        if dp[k + 1][j][0] != -1 {
            rightFalse = dp[k + 1][j][0]
        } else {
            rightFalse = countParentheses2Util(operation: operation, i: k + 1, j: j, isTrue: 0, dp: &dp)
        }

        if operation[k] == "&" {
            if isTrue == 1 {
                result += leftTrue * rightTrue
            } else {
                result += leftTrue * rightFalse
                    + leftFalse * rightTrue
                    + leftFalse * rightFalse
            }
        } else if operation[k] == "|" {
            if isTrue == 1 {
                result += leftTrue * rightTrue
                    + leftTrue * rightFalse
                    + leftFalse * rightTrue
            } else {
                result += leftFalse * rightFalse
            }
        } else if operation[k] == "^" {
            if isTrue == 1 {
                result += leftTrue * rightFalse
                    + leftFalse * rightTrue
            } else {
                result += leftTrue * rightTrue
                    + leftFalse * rightFalse
            }
        }

        dp[i][j][isTrue] = result
    }

    return result
}


var symbols = ["T", "T", "F", "T"]
var operators = ["|", "&", "^"]

var result = countParentheses1(symbols: symbols, operators: operators)

print(result)
print("Output should be: 4\n")

result = countParentheses2(symbols: symbols, operators: operators)

print(result)
print("Output should be: 4")
