//
//  UndirectedGraph.swift
//  Algoritmos
//
//  Created by Yeniel Landestoy on 18/1/23.
//

import Foundation

class UndirectedGraph: CustomStringConvertible {
    var vertices: [Vertice] = []
    var arcs: [Arc] = []

    var description: String {
        var result = ""

        result += "VERTICES\n"
        vertices.forEach { result += $0.description + "\n" }

        result += "ARCS\n"
        arcs.forEach { result += $0.description + "\n" }

        return result
    }

    init(arcs: [Arc]) {
        arcs.forEach { addArc(v1: $0.v1, v2: $0.v2, weight: $0.weight)}
    }

    @discardableResult func addVertice(id: String) -> Vertice {
        guard let vertice = findVertice(id: id) else {
            let newVertice = Vertice(id: id)

            vertices.append(newVertice)

            return newVertice
        }

        return vertice
    }

    func addArc(v1 id1: String, v2 id2: String, weight: Int = 0) {
        let v1 = addVertice(id: id1)
        let v2 = addVertice(id: id2)
        let arc = Arc(v1: id1, v2: id2, weight: weight)

        if let v1Index = indexOf(vertice: v1) {
            vertices[v1Index].adjacents.insert(id2)
            vertices[v1Index].arcs.append(arc)
        }

        if let v2Index = indexOf(vertice: v2) {
            vertices[v2Index].adjacents.insert(id1)
            vertices[v2Index].arcs.append(arc)
        }

        arcs.append(arc)
    }

    func findVertice(id: String) -> Vertice? {
        vertices.first(where: { $0.id == id })
    }

    func indexOf(vertice: Vertice) -> Int? {
        vertices.firstIndex(of: vertice)
    }

    func arcWeight(v1: String, v2: String) -> Int {
        let arc = arcOf(v1: v1, v2: v2)

        return arc?.weight ?? Int.max
    }

    func arcOf(v1: String, v2: String) -> Arc? {
        arcs.first(where: {
            ($0.v1 == v1 && $0.v2 == v2)
            || ($0.v1 == v2 && $0.v2 == v1)
        })
    }

    func visit(vertice: Vertice) {
        if let index = vertices.firstIndex(of: vertice) {
            vertices[index].visited = true
        }
    }

    func unVisit(vertice: Vertice) {
        if let index = vertices.firstIndex(of: vertice) {
            vertices[index].visited = false
        }
    }

    func visited(vertice id: String) -> Bool {
        guard let vertice = findVertice(id: id) else {
            return false
        }

        return vertice.visited
    }

    func notVisited(vertice id: String) -> Bool {
        guard let vertice = findVertice(id: id) else {
            return false
        }

        return !vertice.visited
    }
}

struct Vertice: Identifiable, Equatable, CustomStringConvertible {
    let id: String
    var adjacents: Set<String> = Set<String>()
    var arcs: [Arc] = []
    var visited = false
    var key: Int = Int.max

    var description: String {
        var adjacentsDescription = ""

        adjacents.forEach { adjacentsDescription.append("\n    \($0.description)") }

        return "Vertice - {\(id), Adjacents: \(adjacents.joined(separator: ", "))}"
    }

    static func == (lhs: Vertice, rhs: Vertice) -> Bool {
        return lhs.id == rhs.id
    }
}

struct Arc: Comparable, CustomStringConvertible {
    let v1: String
    let v2: String
    var weight: Int

    init(v1: String, v2: String, weight: Int = 0) {
        self.v1 = v1
        self.v2 = v2
        self.weight = weight
    }

    var description: String {
        "\(v1) - \(v2): \(String(weight))"
    }

    static func < (lhs: Arc, rhs: Arc) -> Bool {
        lhs.weight < rhs.weight
    }
}
