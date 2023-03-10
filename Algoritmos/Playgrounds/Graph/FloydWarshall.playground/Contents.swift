import UIKit

extension Graph {
    func floydWarshallGraph() -> [String: [String: Int]] {
        var graph = [String: [String: Int]]()

        nodes.forEach { row in
            graph[row.id] = [String: Int]()

            nodes.forEach { col in
                graph[row.id]?[col.id] = row.weightTo(node: col)
            }
        }

        return graph
    }

    func floydWarshall() -> [String: [String: Int]] {
        var graph = floydWarshallGraph()
        var distances = floydWarshallGraph()
        var nodes = graph.keys

        nodes.forEach { keyK in
            nodes.forEach { keyI in
                nodes.forEach { keyJ in
                    let distanceIK = distances[keyI]?[keyK] ?? Int.max
                    let distanceKJ = distances[keyK]?[keyJ] ?? Int.max
                    let distanceIJ = distances[keyI]?[keyJ] ?? Int.max

                    if distanceIK != Int.max && distanceKJ != Int.max {
                        if distanceIK + distanceKJ < distanceIJ {
                            distances[keyI]?[keyJ] = distanceIK + distanceKJ
                        }
                    }
                }
            }
        }

        return distances
    }
}

var edges = [
    ("0", "3", 10),
    ("0", "1", 5),
    ("1", "2", 3),
    ("2", "3", 1)
]

var graph = Graph()

graph.addNode(id: "0")
graph.addNode(id: "1")
graph.addNode(id: "2")
graph.addNode(id: "3")

graph.addEdge(from: "0", to: "2", weight: 10)
graph.addEdge(from: "0", to: "1", weight: 5)
graph.addEdge(from: "1", to: "2", weight: 3)
graph.addEdge(from: "2", to: "3", weight: 1)

let floydMarshallDistances = graph.floydWarshall()

floydMarshallDistances.forEach {
    print($0)
}

print("Output should be:")
print("0 - 0: 0")
print("0 - 1: 5")
print("0 - 2: 8")
print("0 - 3: 9")

print("1 - 0: Int.max")
print("1 - 1: 0")
print("1 - 2: 3")
print("1 - 3: 4")

print("2 - 0: Int.max")
print("2 - 1: Int.max")
print("2 - 2: 0")
print("2 - 3: 1")

print("3 - 0: Int.max")
print("3 - 1: Int.max")
print("3 - 2: Int.max")
print("3 - 3: 0")
