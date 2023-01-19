import UIKit

extension UndirectedGraph {
    func isCylce() -> Bool {
        var parent: [String: Vertice] = [:]

        vertices.forEach { parent[$0.id] = $0 }

        for arc in arcs {
            let subsetX = find(parent: parent, vertice: arc.firstVertice)
            let subsetY = find(parent: parent, vertice: arc.secondVertice)

            if subsetX == subsetY {
                return true
            }

            union(parent: &parent, subsetX: subsetX, subsetY: subsetY)
        }

        return false
    }

    // Find the subset of a vertice
    func find(parent: [String: Vertice], vertice: Vertice) -> Vertice {
        guard let parentVertice = parent[vertice.id] else {
            return vertice
        }

        if parentVertice == vertice {
            return vertice
        }

        return find(parent: parent, vertice: parentVertice)
    }

    // Union to subsets
    func union(parent: inout [String: Vertice], subsetX: Vertice, subsetY: Vertice) {
        parent[subsetX.id] = subsetY
    }
}

let v0 = Vertice(id: "0")
let v1 = Vertice(id: "1")
let v2 = Vertice(id: "2")

let vertices = [v0, v1, v2]

let arcs = [
    Arc(firstVertice: v0, secondVertice: v1),
    Arc(firstVertice: v1, secondVertice: v2),
    Arc(firstVertice: v0, secondVertice: v2)
]

let graph = UndirectedGraph(vertices: vertices, arcs: arcs)

if graph.isCylce() {
    print("Graph contains cycle")
} else {
    print("Graph doesn't contain cycle")
}

print("Output should be Graph contains cycle")
