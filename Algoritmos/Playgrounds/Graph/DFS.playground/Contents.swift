import UIKit

extension Graph {
    func visit(node: Node) {
        visit(node: node)
        print(node.id)

        node.edges.forEach {
            if notVisited(node: $0.to) {
                visit(node: $0.to)
            }
        }
    }

    func dfs(startNode: String) {
        guard let node = getNode(id: startNode) else {
            return
        }

        visit(node: node)
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

graph.dfs(startNode: "2")
print("Output should be 2 0 1 3")

