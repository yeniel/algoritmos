import UIKit

// Time Complexity of above solution is exponential. In worst case, we may end up doing O(3m) operations. The worst case happens when none of characters of two strings match. Below is a recursive call diagram for worst case.
// Auxiliary Space: O(1), because no extra space is utilized.
func editDistance1(s1: String, s2: String) -> Int {
    if s1.count == 0 {
        return s2.count
    }

    if s2.count == 0 {
        return s1.count
    }

    if s1.last == s2.last {
        return editDistance1(s1: String(s1.dropLast()), s2: String(s2.dropLast()))
    }

    let insert = editDistance1(s1: s1, s2: String(s2.dropLast()))
    let remove = editDistance1(s1: String(s1.dropLast()), s2: s2)
    let replace = editDistance1(s1: String(s1.dropLast()), s2: String(s2.dropLast()))

    return 1 + min(insert, remove, replace)
}

// Time Complexity: O(m x n)
// Auxiliary Space: O(m x n)
func editDistance2(s1: String, s2: String) -> Int {
    var dp = buildDP(xCount: s1.count, yCount: s2.count, initial: 0)

    for i in 0...s1.count {
        for j in 0...s2.count {
            if i == 0 {
                dp[i][j] = j
            } else if j == 0 {
                dp[i][j] = i
            } else {
                let indexS1 = s1.index(s1.endIndex, offsetBy: -i)
                let indexS2 = s2.index(s2.endIndex, offsetBy: -j)

                if s1[indexS1] == s2[indexS2] {
                    dp[i][j] = dp[i - 1][j - 1]
                } else {
                    let insert = dp[i][j - 1]
                    let remove = dp[i - 1][j]
                    let replace = dp[i - 1][j - 1]

                    dp[i][j] = 1 + min(insert, remove, replace)
                }
            }
        }
    }

    return dp[s1.count][s2.count]
}

// Time Complexity: O(m x n)
// Auxiliary Space: O( m )
func editDistance3(s1: String, s2: String) -> Int {
    var dp = buildDP(xCount: s1.count, yCount: s2.count, initial: 0)

    for i in 0...s1.count {
        dp[0][i] = i
    }

    for i in 1...s2.count {
        for j in 0...s1.count {
            if j == 0 {
                dp[i % 2][j] = i
            } else {
                let indexS1 = s1.index(s1.endIndex, offsetBy: -j)
                let indexS2 = s2.index(s2.endIndex, offsetBy: -i)

                if s1[indexS1] == s2[indexS2] {
                    dp[i % 2][j] = dp[(i - 1) % 2][j - 1]
                } else {
                    let insert = dp[(i - 1) % 2][j]
                    let remove = dp[i % 2][j - 1]
                    let replace = dp[(i - 1) % 2][j - 1]

                    dp[i % 2][j] = 1 + min(insert, remove, replace)
                }
            }

        }
    }

    return dp[s2.count % 2][s1.count]
}

// Time Complexity: O(m x n)
// Auxiliary Space: O( m *n)+O(m+n) , (m*n) extra array space and (m+n) recursive stack space.
func editDistance4(s1: String, s2: String) -> Int {
    var dp = buildDP(xCount: s1.count, yCount: s2.count, initial: -1)

    return editDistance4Util(s1: s1, s2: s2, dp: &dp)
}

func editDistance4Util(s1: String, s2: String, dp: inout [[Int]]) -> Int {
    if s1.count == 0 {
        return s2.count
    }

    if s2.count == 0 {
        return s1.count
    }

    if dp[s1.count][s2.count] != -1 {
        dp[s1.count][s2.count]
    }

    if s1.last == s2.last {
        if dp[s1.count - 1][s2.count - 1] == -1 {
            dp[s1.count][s2.count] = editDistance4Util(s1: String(s1.dropLast()), s2: String(s2.dropLast()), dp: &dp)
        } else {
            dp[s1.count][s2.count] = dp[s1.count - 1][s2.count - 1]
        }

        return dp[s1.count][s2.count]
    } else {
        var insert: Int
        var remove: Int
        var replace: Int

        if dp[s1.count - 1][s2.count] != -1 {
            insert = dp[s1.count - 1][s2.count];
        } else {
            insert = editDistance4Util(s1: String(s1.dropLast()), s2: s2, dp: &dp)
        }

        if dp[s1.count][s2.count - 1] != -1 {
            remove = dp[s1.count][s2.count - 1]
        } else {
          remove = editDistance4Util(s1: s1, s2: String(s2.dropLast()), dp: &dp)
        }

        if dp[s1.count - 1][s2.count - 1] != -1 {
            replace = dp[s1.count - 1][s2.count - 1];
        } else {
          replace = editDistance4Util(s1: String(s1.dropLast()), s2: String(s2.dropLast()), dp: &dp)
        }

        dp[s1.count][s2.count] = 1 + min(insert, remove, replace)

        return dp[s1.count][s2.count]
    }
}

func min3(_ n1: Int,_ n2: Int,_ n3: Int) -> Int {
    if n1 <= n2 && n1 <= n3 {
        return n1
    } else if n2 <= n1, n2 <= n3 {
        return n2
    } else {
        return n3
    }
}

var s1 = "sunday"
var s2 = "saturday"
var editDistance = -1

editDistance = editDistance1(s1: s1, s2: s2)

print(editDistance)
print("Output should be: 3\n")

editDistance = editDistance2(s1: s1, s2: s2)

print(editDistance)
print("Output should be: 3\n")

s1 = "food"
s2 = "money"
editDistance = editDistance3(s1: s1, s2: s2)

print(editDistance)
print("Output should be: 4\n")

s1 = "voldemort";
s2 = "dumbledore";
editDistance = editDistance4(s1: s1, s2: s2)

print(editDistance)
print("Output should be: 7\n")

//import SwiftUI
//import PlaygroundSupport

//struct Test: View {
//    var body: some View {
//        Text("Yeniel").foregroundColor(.blue)
//    }
//}
//
//PlaygroundPage.current.setLiveView(Test())
