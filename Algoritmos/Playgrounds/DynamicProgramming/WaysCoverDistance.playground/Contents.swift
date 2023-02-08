import UIKit

// Time Complexity: O(3n).
// The time complexity of the above solution is exponential, a close upper bound is O(3n). From each state 3, a recursive function is called. So the upper bound for n states is O(3n).
// Space complexity: O(1).
func waysToCoverDistanceWith3Steps1(distance: Int) -> Int {
    if distance < 0 {
        return 0
    } else if distance == 0 {
        return 1
    }

    var ways = 0

    for step in 1...3 {
        ways += waysToCoverDistanceWith3Steps1(distance: distance - step)
    }

    return ways
}

// Time Complexity: O(n).
// Only one traversal of the array is needed. So Time Complexity is O(n)
// Space complexity: O(n).
// To store the values in a DP O(n) extra space is needed.
func waysToCoverDistanceWith3Steps2(distance: Int) -> Int {
    var ways: [Int] = []

    ways.append(1)

    if distance >= 1 {
        ways.append(1)
    }

    if distance >= 2 {
        ways.append(2)
    }

    for step in 3...distance {
        ways.append(ways[step - 1] + ways[step - 2] + ways[step - 3])
    }

    return ways[distance]
}

// Time Complexity : O(n)
// Space Complexity : O(1)
func waysToCoverDistanceWith3Steps3(distance: Int) -> Int {
    var ways: [Int] = [1, 1, 2]

    for step in 3...distance {
        ways[step % 3] = ways[(step - 1) % 3] + ways[(step - 2) % 3] + ways[(step - 3) % 3]
    }

    return ways[distance % 3]
}

let distance = 4
var ways = 0

ways = waysToCoverDistanceWith3Steps1(distance: distance)
print(ways)
print("Output should be: 7\n")

ways = waysToCoverDistanceWith3Steps2(distance: distance)
print(ways)
print("Output should be: 7\n")

ways = waysToCoverDistanceWith3Steps3(distance: distance)
print(ways)
print("Output should be: 7\n")
