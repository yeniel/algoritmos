import UIKit

extension Array where Element == Int {
    // Time Complexity:
    // The worst-case time complexity of the above solution is still O(n2). In the worst case, the randomized function may always pick a corner element. The expected time complexity of above randomized QuickSelect is O(n), see CLRS book or MIT video lecture for proof. The assumption in the analysis is, random number generator is equally likely to generate any number in the input range.
    // Auxiliary Space: O(1) since using constant variables
    mutating func ordinalSmallest(ordinalPosition: Int) -> Element {
        ordinalSmallestUtil(leftIndex: 0, rightIndex: count - 1, position: ordinalPosition)
    }

    mutating private func ordinalSmallestUtil(leftIndex: Int, rightIndex: Int, position: Int) -> Element {
        if position > 0, position <= rightIndex - leftIndex + 1 {
            let pivotPosition = randomPartition(leftIndex: leftIndex, rightIndex: rightIndex)

            if pivotPosition - leftIndex == position - 1 {
                return self[pivotPosition]
            }

            if pivotPosition - leftIndex > position - 1 {
                return ordinalSmallestUtil(
                    leftIndex: leftIndex,
                    rightIndex: pivotPosition - 1,
                    position: position
                )
            }

            return ordinalSmallestUtil(
                leftIndex: pivotPosition + 1,
                rightIndex: rightIndex,
                position: position - pivotPosition + leftIndex - 1
            )
        }

        return Int.max
    }

    mutating private func randomPartition(leftIndex: Int, rightIndex: Int) -> Int {
        let count = rightIndex - leftIndex + 1
        let pivot = Int.random(in: 0...count - 1)

        swap(index1: leftIndex + pivot, index2: rightIndex)

        return partition(leftIndex: leftIndex, rightIndex: rightIndex)
    }

    mutating private func partition(leftIndex: Int, rightIndex: Int) -> Int {
        let rightElement = self[rightIndex]
        var partitionPosition = leftIndex

        if leftIndex == rightIndex {
            return partitionPosition
        }

        for index in leftIndex...rightIndex - 1 {
            if self[index] <= rightElement {
                swap(index1: partitionPosition, index2: index)
                partitionPosition += 1
            }
        }

        swap(index1: partitionPosition, index2: rightIndex)

        return partitionPosition
    }

    mutating private func swap(index1: Int, index2: Int) {
        var temp = self[index1]

        self[index1] = self[index2]
        self[index2] = temp
    }
}

var array: [Int]
var ordinalPosition: Int
var result: Int

array = [12, 3, 5, 7, 4, 19, 26]
ordinalPosition = 3
result = array.ordinalSmallest(ordinalPosition: ordinalPosition)

print(result)
print("Output should be: 5")
