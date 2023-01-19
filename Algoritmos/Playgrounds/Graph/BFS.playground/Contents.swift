import UIKit

extension Graph {
    public func bfs(startNode: String) {
        guard let start = getNode(id: startNode) else {
            return
        }
        var queue: [Node] = []

        start.visited = true
        queue.append(start)

        while !queue.isEmpty {
            let node = queue.removeFirst()

            print(node.id)

            node.edges.forEach {
                if !$0.to.visited {
                    $0.to.visited = true
                    queue.append($0.to)
                }
            }
        }
    }
}

var graph = Graph()

graph.addNode(id: "0")
graph.addNode(id: "1")
graph.addNode(id: "2")
graph.addNode(id: "3")

graph.addEdge(from: "0", to: "1")
graph.addEdge(from: "0", to: "2")
graph.addEdge(from: "1", to: "2")
graph.addEdge(from: "2", to: "0")
graph.addEdge(from: "2", to: "3")
graph.addEdge(from: "3", to: "3")

graph.bfs(startNode: "2")

print("Output should be 2 0 3 1")
