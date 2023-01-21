import UIKit

extension UndirectedGraph {
    func bridges() -> [Arc] {
        var bridges: [Arc] = []
        var parent: [String: String] = [:]
        var discoveryTime: [String: Int] = [:]
        var lowValue: [String: Int] = [:]
        var time = 0

        vertices.forEach {
            if !$0.visited {
                bridgesUtil(
                    vertice: $0,
                    parent: &parent,
                    discoveryTime: &discoveryTime,
                    lowValue: &lowValue,
                    time: &time,
                    bridges: &bridges
                )
            }
        }

        return bridges
    }

    func bridgesUtil(
        vertice: Vertice,
        parent: inout [String: String],
        discoveryTime: inout [String: Int],
        lowValue: inout [String: Int],
        time: inout Int,
        bridges: inout [Arc]
    ) {
        visit(vertice: vertice)

        time += 1
        discoveryTime[vertice.id] = time
        lowValue[vertice.id] = time

        vertice.adjacents.forEach { adjacentId in
            guard let adjacentVertice = findVertice(id: adjacentId) else {
                return
            }

            if notVisited(vertice: adjacentId) {
                parent[adjacentId] = vertice.id
                bridgesUtil(
                    vertice: adjacentVertice,
                    parent: &parent,
                    discoveryTime: &discoveryTime,
                    lowValue: &lowValue,
                    time: &time,
                    bridges: &bridges
                )

                let lowValueVertice = lowValue[vertice.id] ?? Int.max
                let lowValueAdjacent = lowValue[adjacentId] ?? Int.max

                lowValue[vertice.id] = min(lowValueVertice, lowValueAdjacent)

                let discoveryTimeVertice = discoveryTime[vertice.id] ?? Int.max

                if lowValueAdjacent > discoveryTimeVertice {
                    if let arc = arcOf(v1: vertice.id, v2: adjacentId) {
                        bridges.append(arc)
                    }
                }
            } else if adjacentId != parent[vertice.id] {
                let lowValueVertice = lowValue[vertice.id] ?? Int.max
                let discoveryTimeAdjacent = discoveryTime[adjacentId] ?? Int.max

                lowValue[vertice.id] = min(lowValueVertice, discoveryTimeAdjacent)
            }
        }
    }
}

let graph1 = UndirectedGraph()

graph1.addArc(v1: "1", v2: "0")
graph1.addArc(v1: "0", v2: "2")
graph1.addArc(v1: "2", v2: "1")
graph1.addArc(v1: "0", v2: "3")
graph1.addArc(v1: "3", v2: "4")

let graph2 = UndirectedGraph()

graph2.addArc(v1: "0", v2: "1")
graph2.addArc(v1: "1", v2: "2")
graph2.addArc(v1: "2", v2: "3")

let graph3 = UndirectedGraph()

graph3.addArc(v1: "0", v2: "1")
graph3.addArc(v1: "1", v2: "2")
graph3.addArc(v1: "2", v2: "0")
graph3.addArc(v1: "1", v2: "3")
graph3.addArc(v1: "1", v2: "4")
graph3.addArc(v1: "1", v2: "6")
graph3.addArc(v1: "3", v2: "5")
graph3.addArc(v1: "4", v2: "5")

print("Bridges of graph1")

let bridges1 = graph1.bridges()

bridges1.forEach { print("\($0.description)") }

print("Output should be:")
print("3 - 4: 0")
print("0 - 3: 0")

print("\nBridges of graph2")

let bridges2 = graph2.bridges()

bridges2.forEach { print("\($0.description)") }

print("Output should be:")
print("2 - 3: 0")
print("1 - 2: 0")
print("0 - 1: 0")

print("\nBridges of graph3")

let bridges3 = graph3.bridges()

bridges3.forEach { print("\($0.description)") }

print("Output should be:")
print("1 - 6: 0")

