import UIKit

// Time Complexity: O(N) where N is the length of the string.
// Auxiliary Space: O(N) where N is the length of the string.
func reverse1(string: String) -> String {
    var letters: [Character] = []
    var x = 0

    for char in s {
        if isLetter(char: char) {
            letters.append(char)
            x += 1
        }
    }

    var reversedLetters: [Character] = []

    for i in stride(from: x - 1, through: 0, by: -1) {
        reversedLetters.append(letters[i])
    }

    x = 0
    var result: [Character] = []

    for char in s {
        if isLetter(char: char) {
            result.append(reversedLetters[x])
            x += 1
        } else {
            result.append(char)
        }
    }

    return String(result)
}

// Time Complexity: O(N) where N is the length of the string.
// Auxiliary Space: O(1).
func reverse2(string: String) -> String {
    var right = s.count - 1
    var left = 0
    var s = string

    while left < right {
        let leftChar = s[s.index(s.startIndex, offsetBy: left)]
        let rightChar = s[s.index(s.startIndex, offsetBy: right)]

        if !isLetter(char: leftChar) {
            left += 1
        } else if (!isLetter(char: rightChar)) {
            right -= 1
        } else {
            s = swap(string: s, charA: leftChar, charB: rightChar)
            left += 1
            right -= 1
        }
    }

    return s
}

func isLetter(char: Character) -> Bool {
    (char >= "a" && char <= "z") || (char >= "A" && char <= "Z")
}

func swap(string: String, charA: Character, charB: Character) -> String {
    var result = ""

    for char in string {
        if char == charA {
            result += String(charB)
        } else if char == charB {
            result += String(charA)
        } else {
            result += String(char)
        }
    }

    return result
}

var s = "Ab,c,de!$"
var result = reverse1(string: s)

print(result)
print("Output should be: ed,c,bA!$\n")

result = reverse2(string: s)

print(result)
print("Output should be: ed,c,bA!$")
