import UIKit

// Time Complexity: O(N2)
// Auxiliary Space: O(M+N)
func alternateSortedArray(array1: [Int], array2: [Int]) -> [[Int]] {
    var result: [[Int]] = []
    var merge: [Int] = Array(repeating: 0, count: array1.count + array2.count)

    alternateSortedArrayUtil(
        array1: array1,
        array2: array2,
        merge: &merge,
        result: &result,
        i: 0,
        j: 0,
        len: 0,
        flag: true
    )

    return result
}

func alternateSortedArrayUtil(
    array1: [Int],
    array2: [Int],
    merge: inout [Int],
    result: inout [[Int]],
    i: Int,
    j: Int,
    len: Int,
    flag: Bool
) {
    if flag {
        if len != 0 {
            result.append(Array(merge[...len]))
        }

        for k in i..<array1.count {
            if len == 0 {
                merge[len] = array1[k]

                alternateSortedArrayUtil(
                    array1: array1,
                    array2: array2,
                    merge: &merge,
                    result: &result,
                    i: k + 1,
                    j: j,
                    len: len,
                    flag: !flag
                )
            } else if array1[k] > merge[len] {
                merge[len + 1] = array1[k]

                alternateSortedArrayUtil(
                    array1: array1,
                    array2: array2,
                    merge: &merge,
                    result: &result,
                    i: k + 1,
                    j: j,
                    len: len + 1,
                    flag: !flag
                )
            }
        }
    } else {
        for l in j..<array2.count {
            if array2[l] > merge[len] {
                merge[len + 1] = array2[l]

                alternateSortedArrayUtil(
                    array1: array1,
                    array2: array2,
                    merge: &merge,
                    result: &result,
                    i: i,
                    j: l + 1,
                    len: len + 1,
                    flag: !flag
                )
            }
        }
    }
}

var array1 = [10, 15, 25]
var array2 = [5, 20, 30]
var result = alternateSortedArray(array1: array1, array2: array2)

result.forEach { print($0) }
print("Output should be: ")
print("[10, 20]")
print("[10, 20, 25, 30]")
print("[10, 30]")
print("[15, 20]")
print("[15, 20, 25, 30]")
print("[15, 30]")
print("[25, 30]")
