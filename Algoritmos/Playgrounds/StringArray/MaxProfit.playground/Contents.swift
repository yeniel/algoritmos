import UIKit

extension Array where Element == Int {
    // Time Complexity: O(N2), Trying to buy every stock and exploring all possibilities.
    // Auxiliary Space: O(1)
    func maxProfit() -> Int {
        maxProfitUtil(start: 0, end: count - 1)
    }

    private func maxProfitUtil(start: Int, end: Int) -> Int {
        if end <= start {
            return 0
        }

        var profit = 0

        for i in start..<end {
            for j in i + 1...end {
                if self[j] > self[i] {
                    let currentProfit = self[j] - self[i]
                        + maxProfitUtil(start: start, end: i - 1)
                        + maxProfitUtil(start: j + 1, end: end)

                    profit = Swift.max(profit, currentProfit)
                }
            }
        }

        return profit
    }

    // Time Complexity:  O(N), The outer loop runs till I become n-1. The inner two loops increment the value of I in every iteration.
    // Auxiliary Space: O(1)
    func profitableTransactions() -> [(buy: Int, sell: Int)] {
        var transactions: [(buy: Int, sell: Int)] = []

        if count == 1 {
            return transactions
        }

        var index = 0

        while index < count - 1 {
            while (index < count - 1), (self[index + 1] <= self[index]) {
                index += 1
            }

            if index == count - 1 {
                break
            }

            let buy = index

            index += 1

            while index < count, self[index] >= self[index - 1] {
                index += 1
            }

            let sell = index - 1

            transactions.append((buy: self[buy], sell: self[sell]))
        }

        return transactions
    }

    // Time Complexity: O(N), Traversing over the array of size N.
    // Auxiliary Space: O(1)
    func maxProfit2() -> Int {
        var result = 0

        for i in 1..<count {
            if self[i] > self[i - 1] {
                result += self[i] - self[i - 1]
            }
        }

        return result
    }
}

var array: [Int]
var result: Int

array = [100, 180, 260, 310, 40, 535, 695]
result = array.maxProfit()
print(result)
print("Output should be: 865\n")

array = [100, 180, 260, 310, 40, 535, 695]
let transactions = array.profitableTransactions()
print(transactions)
print("Output should be: [(buy: 100, sell: 310), (buy: 40, sell: 695)]\n")

array = [100, 180, 260, 310, 40, 535, 695]
result = array.maxProfit2()
print(result)
print("Output should be: 865\n")
