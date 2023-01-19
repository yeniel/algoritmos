import UIKit

extension Graph {
    func topologicalSort() -> [Node] {
        var stack: [Node] = []

        nodes.forEach { node in
            if !node.visited {
                topologicalSortUtil(node: node, stack: &stack)
            }
        }

        return stack
    }

    func topologicalSortUtil(node: Node, stack: inout [Node]) {
        node.visited = true

        node.edges.forEach { edge in
            if !edge.to.visited {
                topologicalSortUtil(node: edge.to, stack: &stack)
            }
        }

        stack.append(node)
    }
}

var graph = Graph()

graph.addNode(id: "0")
graph.addNode(id: "1")
graph.addNode(id: "2")
graph.addNode(id: "3")
graph.addNode(id: "4")
graph.addNode(id: "5")

graph.addEdge(from: "5", to: "2")
graph.addEdge(from: "5", to: "0")
graph.addEdge(from: "4", to: "0")
graph.addEdge(from: "4", to: "1")
graph.addEdge(from: "2", to: "3")
graph.addEdge(from: "3", to: "1")

let topologicalSort = graph.topologicalSort().reversed()

topologicalSort.forEach { print($0.id) }

print("Output should be 5 4 2 3 1 0")
