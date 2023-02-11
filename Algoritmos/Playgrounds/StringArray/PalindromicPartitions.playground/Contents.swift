import UIKit

func palindromicPartitions1(string: String) -> [[String]] {
    let count = string.count
    var partitions: [[String]] = []
    var currentPart: [String] = []

    palindromicPartitions1Util(
        string: string,
        partitions: &partitions,
        currentPart: &currentPart,
        start: 0
    )

    return partitions
}

func palindromicPartitions1Util(
    string s: String,
    partitions: inout [[String]],
    currentPart: inout [String],
    start: Int
) {
    if start >= s.count {
        partitions.append(currentPart)

        return
    }

    let startIndex = s.index(s.startIndex, offsetBy: start)

    for i in start..<s.count {
        var index = s.index(s.startIndex, offsetBy: i)
        var substring = s[startIndex...index]

        if (isPalindrome(string: String(substring))) {
            index = s.index(s.startIndex, offsetBy: i)
            substring = s[startIndex...index]
            currentPart.append(String(substring))
            palindromicPartitions1Util(
                string: s,
                partitions: &partitions,
                currentPart: &currentPart,
                start: i + 1
            )
            currentPart.popLast()
        }
    }
}

func isPalindrome(string: String) -> Bool {
    if string.count == 1 {
        return true
    }

    if string.first != string.last {
        return false
    }

    return isPalindrome(string: String(string.dropFirst().dropLast()))
}

var string = "nitin"
var result = palindromicPartitions1(string: string)

print(result)
print("Output should be: [['n', 'i', 't', 'i', 'n'], ['n', 'iti', 'n'], ['nitin']]")
