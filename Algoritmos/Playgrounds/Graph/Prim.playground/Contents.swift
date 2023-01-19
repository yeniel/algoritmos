import UIKit

extension UndirectedGraph {
    func prim() -> UndirectedGraph {
        let emptyGraph = UndirectedGraph(vertices: [], arcs: [])
        var primVertices: [Vertice] = []
        var primArcs: [Arc] = []
        var heap = Array(vertices)

        guard var rootVertice = vertices.first else {
            return emptyGraph
        }

        rootVertice.key = 0
        primVertices.append(rootVertice)

        while !heap.isEmpty {
            guard let minVertice = (heap.min { $0.key < $1.key }) else {
                continue
            }

            if let primArc = primArc(primVertices: primVertices, head: minVertice) {
                primArcs.append(primArc)
            }

            primVertices.append(minVertice)
            heap.removeAll(where: { $0 == minVertice })

            for adjacent in minVertice.adjacents {
                let arcWeight = arcWeight(vertice1: minVertice, vertice2: adjacent)
                let adjacentHeap = heap.first(where: { $0 == adjacent })

                if let adjacentHeap = adjacentHeap, arcWeight < adjacentHeap.key {
                    let adjacentIndex = heap.firstIndex(of: adjacent) ?? 0

                    heap[adjacentIndex].key = arcWeight
                }
            }
        }

        return UndirectedGraph(vertices: vertices, arcs: primArcs)
    }

    func primArc(primVertices: [Vertice], head: Vertice) -> Arc? {
        let primAdjacents = head.adjacents.filter { primVertices.contains($0) }
        let primArcs = primAdjacents.map { arcOf(vertice1: head, vertice2: $0)! }

        return primArcs.min { $0.weight < $1.weight }
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

let primMSTGraph = graph.prim()

primMSTGraph.arcs.forEach { print($0.description) }
