import UIKit

extension Graph {
    func findWords(dictionary: [String]) -> Set<String> {
        var words = Set<String>()

        dictionary.forEach { word in
            if findWord(word: word) {
                words.insert(word)
            }
        }

        return words
    }

    func findWord(word: String) -> Bool {
        var chars = ""

        for node in nodes {
            if findWordsUtil(node: node, chars: &chars, word: word) {
                return true
            }
        }

        return false
    }

    func findWordsUtil(node: Node, chars: inout String, word: String) -> Bool {
        visit(node: node)

        chars += node.value

        if chars == word {
            return true
        } else if chars.count < word.count {
            for edge in node.edges {
                if notVisited(node: edge.to) {
                    if findWordsUtil(node: edge.to, chars: &chars, word: word) {
                        return true
                    }
                }
            }
        }

        chars = String(chars.dropLast())
        unVisit(node: node)

        return false
    }
}

var graph = Graph()

graph.addNode(id: "1", value: "G")
graph.addNode(id: "2", value: "I")
graph.addNode(id: "3", value: "Z")
graph.addNode(id: "4", value: "U")
graph.addNode(id: "5", value: "E")
graph.addNode(id: "6", value: "K")
graph.addNode(id: "7", value: "Q")
graph.addNode(id: "8", value: "S")
graph.addNode(id: "9", value: "E")

graph.addEdge(from: "1", to: "2")
graph.addEdge(from: "1", to: "5")
graph.addEdge(from: "1", to: "4")
graph.addEdge(from: "2", to: "1")
graph.addEdge(from: "2", to: "4")
graph.addEdge(from: "2", to: "5")
graph.addEdge(from: "2", to: "6")
graph.addEdge(from: "2", to: "3")
graph.addEdge(from: "3", to: "2")
graph.addEdge(from: "3", to: "5")
graph.addEdge(from: "3", to: "6")
graph.addEdge(from: "4", to: "1")
graph.addEdge(from: "4", to: "2")
graph.addEdge(from: "4", to: "5")
graph.addEdge(from: "4", to: "8")
graph.addEdge(from: "4", to: "7")
graph.addEdge(from: "5", to: "1")
graph.addEdge(from: "5", to: "2")
graph.addEdge(from: "5", to: "3")
graph.addEdge(from: "5", to: "4")
graph.addEdge(from: "5", to: "6")
graph.addEdge(from: "5", to: "7")
graph.addEdge(from: "5", to: "8")
graph.addEdge(from: "5", to: "9")
graph.addEdge(from: "6", to: "3")
graph.addEdge(from: "6", to: "2")
graph.addEdge(from: "6", to: "5")
graph.addEdge(from: "6", to: "8")
graph.addEdge(from: "6", to: "9")
graph.addEdge(from: "7", to: "4")
graph.addEdge(from: "7", to: "5")
graph.addEdge(from: "7", to: "8")
graph.addEdge(from: "8", to: "7")
graph.addEdge(from: "8", to: "4")
graph.addEdge(from: "8", to: "5")
graph.addEdge(from: "8", to: "6")
graph.addEdge(from: "8", to: "9")
graph.addEdge(from: "9", to: "6")
graph.addEdge(from: "9", to: "5")
graph.addEdge(from: "9", to: "8")

let dictionary = ["GEEKS", "FOR", "QUIZ", "GO", "SUGUZ"]
let words = graph.findWords(dictionary: dictionary)

words.forEach { print($0) }
print("Output should be QUIZ GEEKS")
