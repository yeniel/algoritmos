import UIKit

extension UndirectedGraph {
    func isCylce() -> Bool {
        var parent: [String: String] = [:]

        vertices.forEach { parent[$0.id] = $0.id }

        for arc in arcs {
            let subsetX = find(parent: parent, vertice: arc.v1)
            let subsetY = find(parent: parent, vertice: arc.v2)

            if subsetX == subsetY {
                return true
            }

            union(parent: &parent, subsetX: subsetX, subsetY: subsetY)
        }

        return false
    }

    // Find the subset of a vertice
    func find(parent: [String: String], vertice: String) -> String {
        guard let parentVertice = parent[vertice] else {
            return vertice
        }

        if parentVertice == vertice {
            return vertice
        }

        return find(parent: parent, vertice: parentVertice)
    }

    // Union to subsets
    func union(parent: inout [String: String], subsetX: String, subsetY: String) {
        parent[subsetX] = subsetY
    }
}

let arcs = [
    Arc(v1: "0", v2: "1"),
    Arc(v1: "1", v2: "2"),
    Arc(v1: "0", v2: "2")
]

let graph = UndirectedGraph(arcs: arcs)

if graph.isCylce() {
    print("Graph contains cycle")
} else {
    print("Graph doesn't contain cycle")
}

print("Output should be Graph contains cycle")
