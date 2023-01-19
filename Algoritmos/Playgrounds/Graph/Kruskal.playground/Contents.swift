import UIKit

struct Subset {
    let parent: Vertice
    let rank: Int
}
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
let v3 = Vertice(id: "3")
let v4 = Vertice(id: "4")
let v5 = Vertice(id: "5")
let v6 = Vertice(id: "6")
let v7 = Vertice(id: "7")
let v8 = Vertice(id: "8")

let graphVertices = [v0, v1, v2, v3, v4, v5, v6, v7, v8]

let graphArcs = [
    Arc(firstVertice: v0, secondVertice: v1, weight: 4),
    Arc(firstVertice: v0, secondVertice: v7, weight: 8),
    Arc(firstVertice: v1, secondVertice: v2, weight: 8),
    Arc(firstVertice: v1, secondVertice: v7, weight: 11),
    Arc(firstVertice: v2, secondVertice: v3, weight: 7),
    Arc(firstVertice: v2, secondVertice: v5, weight: 4),
    Arc(firstVertice: v2, secondVertice: v8, weight: 2),
    Arc(firstVertice: v3, secondVertice: v4, weight: 9),
    Arc(firstVertice: v3, secondVertice: v5, weight: 14),
    Arc(firstVertice: v4, secondVertice: v5, weight: 10),
    Arc(firstVertice: v5, secondVertice: v6, weight: 2),
    Arc(firstVertice: v6, secondVertice: v7, weight: 1),
    Arc(firstVertice: v6, secondVertice: v8, weight: 6),
    Arc(firstVertice: v7, secondVertice: v8, weight: 7),
]

let graph = UndirectedGraph(vertices: graphVertices, arcs: graphArcs)

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
