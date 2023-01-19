import UIKit

extension Graph {
    func visit(node: Node) {
        node.visited = true
        print(node.id)

        node.edges.forEach {
            if !$0.to.visited {
                visit(node: $0.to)
            }
        }
    }

    func dfs(startNode: String) {
        guard let node = getNode(value: startNode) else {
            return
        }

        visit(node: node)
    }
}

var edges = [
    ("A", "B"),
    ("A", "C"),
    ("B", "C"),
    ("C", "A"),
    ("C", "D"),
    ("D", "D")
]

var graph = Graph(edges: edges)

graph.dfs(startNode: "C")

