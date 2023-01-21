import UIKit

extension UndirectedGraph {
    func kruskal() -> UndirectedGraph {
        var kruskalArcs: [Arc] = []
        var sortedArcs = arcs.sorted()

        while kruskalArcs.count < vertices.count - 1 {
            kruskalArcs.append(sortedArcs.removeFirst())

            if UndirectedGraph(arcs: kruskalArcs).isCylce() {
                kruskalArcs.removeLast()
            }
        }

        return UndirectedGraph(arcs: kruskalArcs)
    }

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

let graphArcs = [
    Arc(v1: "0", v2: "1", weight: 4),
    Arc(v1: "0", v2: "7", weight: 8),
    Arc(v1: "1", v2: "2", weight: 8),
    Arc(v1: "1", v2: "7", weight: 11),
    Arc(v1: "2", v2: "3", weight: 7),
    Arc(v1: "2", v2: "5", weight: 4),
    Arc(v1: "2", v2: "8", weight: 2),
    Arc(v1: "3", v2: "4", weight: 9),
    Arc(v1: "3", v2: "5", weight: 14),
    Arc(v1: "4", v2: "5", weight: 10),
    Arc(v1: "5", v2: "6", weight: 2),
    Arc(v1: "6", v2: "7", weight: 1),
    Arc(v1: "6", v2: "8", weight: 6),
    Arc(v1: "7", v2: "8", weight: 7),
]

let graph = UndirectedGraph(arcs: graphArcs)

let kruskalMSTGraph = graph.kruskal()

kruskalMSTGraph.arcs.forEach { print($0.description) }

print("Output should be:")
print("6 - 7: 1")
print("2 - 8: 2")
print("5 - 6: 2")
print("0 - 1: 4")
print("2 - 5: 4")
print("2 - 3: 7")
print("0 - 7: 8")
print("3 - 4: 9")
