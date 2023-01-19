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

let graph = Graph(edges: edges)

let floydMarshallDistances = graph.floydWarshall()

print(floydMarshallDistances)

