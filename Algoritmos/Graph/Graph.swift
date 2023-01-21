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

    func addNode(id: String, visited: Bool = false, edges: [Edge] = [], value: String = "") {
        nodes.append(Node(id: id, visited: visited, edges: edges, value: value))
    }

    func addEdge(from: String, to: String, weight: Int = 0) {
        guard let fromNode = getNode(id: from) else {
            return
        }

        guard let toNode = getNode(id: to) else {
            return
        }

        let edge = Edge(from: fromNode, to: toNode, weight: weight)

        fromNode.edges.append(edge)
        edges.append(edge)
    }

    func getNode(id: String) -> Node? {
        nodes.first { $0.id == id }
    }

    func visit(node: Node) {
        if let index = nodes.firstIndex(of: node) {
            nodes[index].visited = true
        }
    }

    func unVisit(node: Node) {
        if let index = nodes.firstIndex(of: node) {
            nodes[index].visited = false
        }
    }

    func visited(node: Node) -> Bool {
        guard let node = getNode(id: node.id) else {
            return false
        }

        return node.visited
    }

    func notVisited(node: Node) -> Bool {
        guard let node = getNode(id: node.id) else {
            return false
        }

        return !node.visited
    }
}

class Node: Equatable, Identifiable {
    var id: String
    var edges: [Edge]
    var visited = false
    var distance: Int = Int.max
    var previous: Node?
    var value: String

    init(id: String, visited: Bool, edges: [Edge], value: String = "") {
        self.id = id
        self.visited = visited
        self.edges = edges
        self.value = value
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

    init(from: Node, to: Node, weight: Int) {
        self.from = from
        self.to = to
        self.weight = weight
    }
}
