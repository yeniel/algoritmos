//
//  Graph.swift
//  Algoritmos
//
//  Created by Yeniel Landestoy on 16/1/23.
//

import Foundation

class Graph {
    var nodes: [Node] = []
    var edges: [Edge] = []

    init(edges: [(String, String, Int)]) {
        var nodeNames = Set<String>()

        edges.forEach { edge in
            nodeNames.insert(String(edge.0))
            nodeNames.insert(String(edge.1))
        }

        for node in nodeNames {
            let newNode = Node(id: node, visited: false, edges: [])

            nodes.append(newNode)
        }

        for (from, to, weight) in edges {
            if let fromNode = getNode(value: from) {
                if let toNode = getNode(value: to) {
                    let forwardEdge = Edge(to: toNode, from: fromNode, weight: weight)

                    fromNode.edges.append(forwardEdge)
                    self.edges.append(forwardEdge)
                }
            }
        }
    }

    convenience init(edges: [(String, String)]) {
        self.init(edges: edges.map { ($0.0, $0.1, 1) })
    }

    func getNode(value: String) -> Node? {
        nodes.first { $0.id == value }
    }
}

class Node: Equatable, Identifiable {
    var id: String
    var edges: [Edge]
    var visited = false
    var distance: Int = Int.max
    var previous: Node?

    init(id: String, visited: Bool, edges: [Edge]) {
        self.id = id
        self.visited = visited
        self.edges = edges
    }

    var description: String {
        var edgesString = ""

        edges.forEach{ edgesString.append("\n    \($0.description)")}

        return "{ Node, id: \(id), distance: \(distance) visited: \(visited) \(edgesString)}"
    }

    static func ==(lhs: Node, rhs: Node) -> Bool {
        return lhs.id == rhs.id
    }

    func weightTo(node: Node) -> Int {
        if self == node {
            return 0
        }
        
        if let edge = edges.first(where: { $0.to == node }) {
            return edge.weight
        }

        return Int.max
    }
}

class Edge {
    var from: Node
    var to: Node
    var weight: Int

    var description : String {
        return "{ Edge, from: \(from.id), to: \(to.id), weight: \(weight) }"

    }

    init(to: Node, from: Node, weight: Int) {
        self.from = from
        self.to = to
        self.weight = weight
    }
}
