import UIKit

extension UndirectedGraph {
    func prim() -> UndirectedGraph {
        let emptyGraph = UndirectedGraph(arcs: [])
        var primVertices: [Vertice] = []
        var parents: [String: Vertice] = [:]
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

            primVertices.append(minVertice)
            heap.removeAll(where: { $0 == minVertice })

            for adjacentId in minVertice.adjacents {
                let arcWeight = arcWeight(v1: minVertice.id, v2: adjacentId)
                let adjacentHeap = heap.first(where: { $0.id == adjacentId })

                if let adjacentHeap = adjacentHeap, arcWeight < adjacentHeap.key {
                    let adjacentIndex = heap.firstIndex(where: { $0.id == adjacentId }) ?? 0

                    heap[adjacentIndex].key = arcWeight
                    parents[adjacentId] = minVertice
                }
            }
        }

        let primGraph = UndirectedGraph(
            arcs: parents.map { arcOf(v1: $0.key, v2: $0.value.id)! }
        )

        return primGraph
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

let primArcs = graph.prim().arcs.sorted(by: { $0.v1 < $1.v1 })

primArcs.forEach { print($0.description) }

print("Output should be:")
print("0 - 1: 4")
print("1 - 2: 8 OR 0 - 7: 8")
print("2 - 3: 7")
print("2 - 8: 2")
print("2 - 5: 4")
print("3 - 4: 9")
print("5 - 6: 2")
print("6 - 7: 1")
