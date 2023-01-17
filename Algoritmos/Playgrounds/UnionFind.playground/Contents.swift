import UIKit

extension Graph {
    // Find the subset of a node
    func find(parent: [String: Node], node: Node) -> Node {
        guard let parentNode = parent[node.identifier] else {
            return node
        }

        if parentNode == node {
            return node
        }

        return find(parent: parent, node: parentNode)
    }

    // Union to subsets
    func union(parent: inout [String: Node], subsetX: Node, subsetY: Node) {
        parent[subsetX.identifier] = subsetY
    }

    func isCylce() -> Bool {
        var parent: [String: Node] = [:]

        nodes.forEach { parent[$0.identifier] = $0 }

        for edge in edges {
            let subsetX = find(parent: parent, node: edge.from)
            let subsetY = find(parent: parent, node: edge.to)

            if subsetX == subsetY {
                return true
            }

            union(parent: &parent, subsetX: subsetX, subsetY: subsetY)
        }

        return false
    }
}

let edges = [
    ("0", "1"),
    ("1", "2"),
    ("0", "2")
]

let graph = Graph(edges: edges)

if graph.isCylce() {
    print("Graph contains cycle")
} else {
    print("Graph doesn't contain cycle")
}
