import UIKit

extension Graph {
    func addDistancesToTheGraph(from: Node, to: Node) {
        var currentNode = from

        currentNode.visited = true
        currentNode.distance = 0

        var toVisit = [Node]()

        toVisit.append(currentNode)

        while (!toVisit.isEmpty) {
            // print("\nCURRENT NODE: ")
            // print(currentNode.description)

            toVisit = toVisit.filter{ $0.id != currentNode.id }

            currentNode.visited = true

            // Go to each adjacent vertex and update the path length

            for connectedEdge in currentNode.edges {
                let dist = currentNode.distance + connectedEdge.weight

                if (dist < connectedEdge.to.distance) {
                    connectedEdge.to.distance = dist
                    connectedEdge.to.previous = currentNode

                    toVisit.append(connectedEdge.to)

                    if (connectedEdge.to.visited) {
                        connectedEdge.to.visited = false
                    }
                }
            }

            currentNode.visited = true

            //set current node to the smallest vertex

            // print("\nCANDIDATES: ")
            // toVisit.forEach { print($0.description + "\n") }

            if !toVisit.isEmpty {
                guard let minNode = toVisit.min(by: { (a, b) -> Bool in
                    return a.distance < b.distance
                }) else {
                    return
                }

                // print("MIN Node")
                // print(minNode.description)

                // print("\nEDGES:")
                // currentNode.edges.forEach { print($0.description) }
                currentNode = minNode
            }

            if (currentNode == to) {
                return
            }
        }

        return
    }

    func dijkstra(from: String, to: String) -> [Node] {
        guard let fromNode = getNode(value: from) else {
            return []
        }
        guard let toNode = getNode(value: to) else {
            return []
        }

        // print("From Node: \(fromNode.description)")
        // print("To Node: \(toNode.description)")

        addDistancesToTheGraph(from: fromNode, to: toNode)

        // print("FINAL GRAPH")
        // nodes.forEach { print("\($0.description) \n") }

        let visitedNodes = nodes.filter { $0.visited }
        var route: [Node] = []
        var currentNode: Node = toNode

        while currentNode != fromNode {
            route.insert(currentNode, at: 0)

            guard let previous = currentNode.previous else {
                break
            }

            currentNode = previous
        }

        route.insert(fromNode, at: 0)

        return route
    }
}

var edges = [
    ("0", "1", 4),
    ("0", "7", 8),
    ("1", "0", 4),
    ("1", "2", 8),
    ("1", "7", 11),
    ("2", "1", 8),
    ("2", "8", 2),
    ("2", "5", 4),
    ("2", "3", 7),
    ("3", "2", 7),
    ("3", "5", 14),
    ("3", "4", 9),
    ("4", "3", 9),
    ("4", "5", 10),
    ("5", "4", 10),
    ("5", "3", 14),
    ("5", "2", 4),
    ("5", "6", 2),
    ("6", "5", 2),
    ("6", "8", 6),
    ("6", "7", 1),
    ("7", "6", 1),
    ("7", "8", 7),
    ("7", "1", 11),
    ("7", "0", 8),
    ("8", "2", 2),
    ("8", "6", 6),
    ("8", "7", 7)
]

let graph = Graph(edges: edges)
let route: [Node] = graph.dijkstra(from: "0", to: "5")

route.forEach { print($0.id) }
