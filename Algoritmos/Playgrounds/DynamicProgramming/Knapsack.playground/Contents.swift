import UIKit

// Time Complexity: O(2N)
// Auxiliary Space: O(N), Stack space required for recursion
func knapsack1(values: [Int], weights: [Int], capacity: Int) -> Int {
    if capacity == 0 || values.count == 0 {
        return 0
    }

    guard let lastValue = values.last, let lastWeight = weights.last else {
        return 0
    }

    if lastWeight > capacity {
        return knapsack1(values: values.dropLast(), weights: weights.dropLast(), capacity: capacity)
    } else {
        let included = lastValue +
            knapsack1(
                values: values.dropLast(),
                weights: weights.dropLast(),
                capacity: capacity - lastWeight
            )
        let notIncluded = knapsack1(
            values: values.dropLast(),
            weights: weights.dropLast(),
            capacity: capacity
        )

        return max(included, notIncluded)
    }
}

// Time Complexity: O(N * W). As redundant calculations of states are avoided.
// Auxiliary Space: O(N * W) + O(N). The use of a 2D array data structure for storing intermediate states and O(N) auxiliary stack space(ASS) has been used for recursion stack
func knapsack2(values: [Int], weights: [Int], capacity: Int, dp: inout [[Int]]) -> Int {
    let count = values.count

    if count == 0 || capacity == 0 {
        return 0
    }

    if dp[count][capacity] != -1 {
        return dp[count][capacity]
    }

    guard let lastValue = values.last, let lastWeight = weights.last else {
        return 0
    }

    if lastWeight > capacity {
        dp[count][capacity] = knapsack2(
            values: values.dropLast(),
            weights: weights.dropLast(),
            capacity: capacity,
            dp: &dp
        )
    } else {
        let included = lastValue +
            knapsack2(
                values: values.dropLast(),
                weights: weights.dropLast(),
                capacity: capacity - lastWeight,
                dp: &dp
            )
        let notIncluded = knapsack2(
            values: values.dropLast(),
            weights: weights.dropLast(),
            capacity: capacity,
            dp: &dp
        )

        dp[count][capacity] = max(included, notIncluded)
    }

    return dp[count][capacity]
}

// Time Complexity: O(N * W). where ‘N’ is the number of elements and ‘W’ is capacity.
// Auxiliary Space: O(N * W). The use of a 2-D array of size ‘N*W’.
func knapsack3(values: [Int], weights: [Int], capacity: Int) -> Int {
    let count = values.count
    var K: [[Int]] = Array(repeating: [], count: count + 1)

    for i in 0...count {
        K[i] = Array(repeating: 0, count: capacity + 1)

        for w in 0...capacity {
            if i == 0 || w == 0 {
                K[i][w] = 0
            } else if weights[i - 1] <= w {
                K[i][w] = max(values[i - 1] + K[i - 1][w - weights[i - 1]], K[i - 1][w])
            } else {
                K[i][w] = K[i - 1][w]
            }
        }
    }

    return K[count][capacity]
}

var values = [60, 100, 120]
var weights = [10, 20, 30]
var capacity = 50

var knapsack = knapsack1(values: values, weights: weights, capacity: capacity)

print(knapsack)
print("Output should be: 220\n")

var dp = Array(repeating: Array(repeating: -1, count: capacity + 1), count: values.count + 1)
knapsack = knapsack2(values: values, weights: weights, capacity: capacity, dp: &dp)

print(knapsack)
print("Output should be: 220\n")

knapsack = knapsack3(values: values, weights: weights, capacity: capacity)

print(knapsack)
print("Output should be: 220\n")

