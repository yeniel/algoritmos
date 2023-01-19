//
//  UndirectedGraph.swift
//  Algoritmos
//
//  Created by Yeniel Landestoy on 18/1/23.
//

import Foundation

class UndirectedGraph {
    var vertices: [Vertice]
    let arcs: [Arc]

    init(vertices: [Vertice], arcs: [Arc]) {
        self.vertices = vertices
        self.arcs = arcs

        for arc in arcs {
            let firstVerticeIndex = vertices.firstIndex(of: arc.firstVertice) ?? 0
            let secondVerticeIndex = vertices.firstIndex(of: arc.secondVertice) ?? 0

            if !vertices[firstVerticeIndex].adjacents.contains(arc.secondVertice) {
                self.vertices[firstVerticeIndex].adjacents.append(arc.secondVertice)
                self.vertices[firstVerticeIndex].arcs.append(arc)
            }

            if !vertices[secondVerticeIndex].adjacents.contains(arc.firstVertice) {
                self.vertices[secondVerticeIndex].adjacents.append(arc.firstVertice)
                self.vertices[secondVerticeIndex].arcs.append(arc)
            }
        }
    }

    convenience init(arcs: [Arc]) {
        var vertices: [Vertice] = []

        for arc in arcs {
            if !vertices.contains(arc.firstVertice) {
                vertices.append(arc.firstVertice)
            }

            if !vertices.contains(arc.secondVertice) {
                vertices.append(arc.secondVertice)
            }
        }

        self.init(vertices: vertices, arcs: arcs)
    }

    func arcWeight(vertice1: Vertice, vertice2: Vertice) -> Int {
        let arc = arcs.first(where: {
            ($0.firstVertice == vertice1 && $0.secondVertice == vertice2)
            || ($0.firstVertice == vertice2 && $0.secondVertice == vertice1)
        })

        return arc?.weight ?? Int.max
    }

    func arcOf(vertice1: Vertice, vertice2: Vertice) -> Arc? {
        arcs.first(where: {
            $0.firstVertice == vertice1 && $0.secondVertice == vertice2
            || $0.firstVertice == vertice2 && $0.secondVertice == vertice1
        })
    }
}

struct Vertice: Identifiable, Equatable {
    let id: String
    var adjacents: [Vertice] = []
    var arcs: [Arc] = []
    var key: Int = Int.max

    var description: String {
        var adjacentsDescription = ""

        adjacents.forEach { adjacentsDescription.append("\n    \($0.description)") }

        return "{ Vertice, id: \(id), adjacents: \(adjacentsDescription)}"
    }

    static func == (lhs: Vertice, rhs: Vertice) -> Bool {
        return lhs.id == rhs.id
    }
}

struct Arc: Comparable {
    let firstVertice: Vertice
    let secondVertice: Vertice
    var weight: Int

    init(firstVertice: Vertice, secondVertice: Vertice, weight: Int) {
        self.firstVertice = firstVertice
        self.secondVertice = secondVertice
        self.weight = weight
    }

    init(firstVertice: Vertice, secondVertice: Vertice) {
        self.firstVertice = firstVertice
        self.secondVertice = secondVertice
        self.weight = 0
    }

    var description: String {
        "\(firstVertice.id) - \(secondVertice.id): \(String(weight))"
    }

    static func < (lhs: Arc, rhs: Arc) -> Bool {
        lhs.weight < rhs.weight
    }
}
