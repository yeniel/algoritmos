import UIKit

extension Graph {
    public func bfs(startNode: String) {
        guard let start = getNode(value: startNode) else {
            return
        }
        var queue: [Node] = []

        start.visited = true
        queue.append(start)

        while !queue.isEmpty {
            let node = queue.removeFirst()

            print(node.identifier)

            node.edges.forEach {
                if !$0.to.visited {
                    $0.to.visited = true
                    queue.append($0.to)
                }
            }
        }
    }
}

var edges = [
    ("A", "B"),
    ("B", "A"),
    ("B", "C"),
    ("C", "A"),
    ("A", "D"),
    ("D", "D")
]

var graph = Graph(edges: edges)

graph.bfs(startNode: "A")
