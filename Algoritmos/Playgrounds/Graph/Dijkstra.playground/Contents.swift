import UIKit

extension Graph {
    func addDistancesToTheGraph(from: Node, to: Node) {
        var currentNode = from

        visit(node: currentNode)
        currentNode.distance = 0

        var toVisit = [Node]()

        toVisit.append(currentNode)

        while (!toVisit.isEmpty) {
            // print("\nCURRENT NODE: ")
            // print(currentNode.description)

            toVisit = toVisit.filter{ $0.id != currentNode.id }

            visit(node: currentNode)

            // Go to each adjacent vertex and update the path length

            for connectedEdge in currentNode.edges {
                let dist = currentNode.distance + connectedEdge.weight

                if (dist < connectedEdge.to.distance) {
                    connectedEdge.to.distance = dist
                    connectedEdge.to.previous = currentNode

                    toVisit.append(connectedEdge.to)

                    if visited(node: connectedEdge.to) {
                        unVisit(node: connectedEdge.to)
                    }
                }
            }

            visit(node: currentNode)

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
        guard let fromNode = getNode(id: from) else {
            return []
        }
        guard let toNode = getNode(id: to) else {
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

var graph = Graph()

graph.addNode(id: "0")
graph.addNode(id: "1")
graph.addNode(id: "2")
graph.addNode(id: "3")
graph.addNode(id: "4")
graph.addNode(id: "5")
graph.addNode(id: "6")
graph.addNode(id: "7")
graph.addNode(id: "8")

graph.addEdge(from: "0", to: "1", weight: 4)
graph.addEdge(from: "0", to: "7", weight: 8)
graph.addEdge(from: "1", to: "0", weight: 4)
graph.addEdge(from: "1", to: "2", weight: 8)
graph.addEdge(from: "1", to: "7", weight: 11)
graph.addEdge(from: "2", to: "1", weight: 8)
graph.addEdge(from: "2", to: "8", weight: 2)
graph.addEdge(from: "2", to: "5", weight: 4)
graph.addEdge(from: "2", to: "3", weight: 7)
graph.addEdge(from: "3", to: "2", weight: 7)
graph.addEdge(from: "3", to: "5", weight: 14)
graph.addEdge(from: "3", to: "4", weight: 9)
graph.addEdge(from: "4", to: "3", weight: 9)
graph.addEdge(from: "4", to: "5", weight: 10)
graph.addEdge(from: "5", to: "4", weight: 10)
graph.addEdge(from: "5", to: "3", weight: 14)
graph.addEdge(from: "5", to: "2", weight: 4)
graph.addEdge(from: "5", to: "6", weight: 2)
graph.addEdge(from: "6", to: "5", weight: 2)
graph.addEdge(from: "6", to: "8", weight: 6)
graph.addEdge(from: "6", to: "7", weight: 1)
graph.addEdge(from: "7", to: "6", weight: 1)
graph.addEdge(from: "7", to: "8", weight: 7)
graph.addEdge(from: "7", to: "1", weight: 11)
graph.addEdge(from: "7", to: "0", weight: 8)
graph.addEdge(from: "8", to: "2", weight: 2)
graph.addEdge(from: "8", to: "6", weight: 6)
graph.addEdge(from: "8", to: "7", weight: 7)

let route: [Node] = graph.dijkstra(from: "0", to: "5")

route.forEach { print($0.id) }

print("Output should be 0 7 6 5")
