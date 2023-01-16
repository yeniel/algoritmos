//
//  Graph.swift
//  Algoritmos
//
//  Created by Yeniel Landestoy on 16/1/23.
//

import Foundation

public class Node {
    var identifier: String
    var edges = [Edge]()
    var visited = false
    var previous: Node?

    var description: String {
        var edgesString = String()
        edges.forEach{  edgesString.append("\n    " + $0.description)}
        return "{ Node, identifier: \(identifier.description), visited: \(visited) \(edgesString)}"
    }

    public init(visited: Bool, identifier: String, edges: [Edge]) {
        self.visited = visited
        self.identifier = identifier
        self.edges = edges
    }

    public static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}

public class Edge {
    var from: Node
    var to: Node
    var weight: Int

    var description : String {
        return "{ Edge, from: \(from.identifier), to: \(to.identifier), weight: \(weight) }"

    }

    public init(to: Node, from: Node, weight: Int) {
        self.from = from
        self.to = to
        self.weight = weight
    }
}

public class Graph {
    var nodes: [Node] = []

    public init(edges: [(String, String)]) {
        var nodeNames = Set<String>()

        edges.forEach { edge in
            nodeNames.insert(String(edge.0))
            nodeNames.insert(String(edge.1))
        }

        for node in nodeNames {
            let newNode = Node(visited: false, identifier: node, edges: [])

            nodes.append(newNode)
        }

        for (from, to) in edges {
            if let fromNode = getNode(value: from) {
                if let toNode = getNode(value: to) {
                    let forwardEdge = Edge(to: toNode, from: fromNode, weight: 1)

                    fromNode.edges.append(forwardEdge)
                }
            }
        }
    }

    public func getNode(value: String) -> Node? {
        nodes.first { $0.identifier == value }
    }
}
