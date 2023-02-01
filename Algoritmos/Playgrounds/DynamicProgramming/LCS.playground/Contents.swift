import UIKit

// Time Complexity O(2^n)
func lcsSlow(string1: String, string2: String) -> Int {
    if string1.count == 0 || string2.count == 0 {
        return 0
    }

    if string1.last == string2.last {
        return 1 + lcsSlow(string1: String(string1.dropLast()), string2: String(string2.dropLast()))
    }

    return max(
        lcsSlow(string1: string1, string2: String(string2.dropLast())),
        lcsSlow(string1: String(string1.dropLast()), string2: string2)
    )
}

// Time Complexity : O(m*n) ignoring recursion stack space
// Auxiliary Space: O(m*n)
func lcsFast1(string1: String, string2: String) -> Int {
    var lcsCounts: [[Int]] = []

    for _ in 0...string1.count {
        lcsCounts.append(Array(repeating: -1, count: string2.count + 1))
    }

    return lcsFast1Util(string1: string1, string2: string2, lcsCounts: &lcsCounts)
}

func lcsFast1Util(string1: String, string2: String, lcsCounts: inout [[Int]]) -> Int {
    if string1.count == 0 || string2.count == 0 {
        return 0
    }

    if string1.last == string2.last {
        lcsCounts[string1.count][string2.count] = 1 + lcsFast1Util(string1: String(string1.dropLast()), string2: String(string2.dropLast()), lcsCounts: &lcsCounts)

        return lcsCounts[string1.count][string2.count]
    }

    if lcsCounts[string1.count][string2.count] != -1 {
        return lcsCounts[string1.count][string2.count]
    }

    let lcs1 = lcsFast1Util(string1: string1, string2: String(string2.dropLast()), lcsCounts: &lcsCounts)
    let lcs2 = lcsFast1Util(string1: String(string1.dropLast()), string2: String(string2.dropLast()), lcsCounts: &lcsCounts)

    lcsCounts[string1.count][string2.count] = max(lcs1, lcs2)

    return lcsCounts[string1.count][string2.count]
}

// Time Complexity : O(m*n)
// Auxiliary Space: O(m*n)
func lcsFast2(string1: String, string2: String) -> Int {
    var lcsCounts: [[Int]] = []

    for _ in 0...string1.count {
        lcsCounts.append(Array(repeating: 0, count: string2.count + 1))
    }

    for countS1 in 0...string1.count {
        for countS2 in 0...string2.count {
            if countS1 != 0 && countS2 != 0 {
                let indexS1 = string1.index(string1.startIndex, offsetBy: countS1 - 1)
                let indexS2 = string2.index(string2.startIndex, offsetBy: countS2 - 1)

                if string1[indexS1] == string2[indexS2] {
                    lcsCounts[countS1][countS2] = lcsCounts[countS1 - 1][countS2 - 1] + 1
                } else {
                    lcsCounts[countS1][countS2] = max(lcsCounts[countS1 - 1][countS2], lcsCounts[countS1][countS2 - 1])
                }
            }
        }
    }

    return lcsCounts[string1.count][string2.count]
}

let string1 = "AGGTAB"
let string2 = "GXTXAYB"
var lcs = 0

lcs = lcsSlow(string1: string1, string2: string2)

print(lcs)
print("Output should be: 4")

lcs = lcsFast1(string1: string1, string2: string2)

print(lcs)
print("Output should be: 4")

lcs = lcsFast2(string1: string1, string2: string2)

print(lcs)
print("Output should be: 4")
