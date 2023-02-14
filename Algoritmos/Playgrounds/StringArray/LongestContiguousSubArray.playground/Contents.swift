import UIKit

extension Array where Element == Int, Element: Comparable {
    func longestContiguousSubArray() -> Int {
        var result = 1

        for i in 0..<count - 1 {
            var mn = self[i]
            var mx = self[i]

            for j in i + 1..<count {
                mn = Swift.min(mn, self[j])
                mx = Swift.max(mx, self[j])

                if mx - mn == j - i {
                    result = Swift.max(result, mx - mn + 1)
                }
            }
        }

        return result
    }
}

var array: [Int]
var result: Int

array = [1, 56, 58, 57, 90, 92, 94, 93, 91, 45]
result = array.longestContiguousSubArray()
print(result)
print("Output should be: 5")
