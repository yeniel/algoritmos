//
//  Tree.swift
//  Algoritmos
//
//  Created by Yeniel Landestoy on 10/2/23.
//

import Foundation

class Tree<T: Comparable> {
    var root: TreeNode<T>?

    var isEmpty: Bool { root == nil }

    init(root: TreeNode<T>? = nil) {
        self.root = root
    }
}

extension Tree: CustomStringConvertible where T: CustomStringConvertible {
    var description: String {
        guard var current = root else {
            return "Empty"
        }

        return ""
    }
}

class TreeNode<T: Comparable>: Identifiable, Equatable, Comparable {
    let id = UUID()
    let value: T
    var left: TreeNode?
    var right: TreeNode?

    init(value: T, left: TreeNode? = nil, right: TreeNode? = nil) {
        self.value = value
        self.left = left
        self.right = right
    }

    static func == <T: Comparable>(lhs: TreeNode<T>, rhs: TreeNode<T>) -> Bool {
        lhs.value == rhs.value
    }

    static func < <T: Comparable>(lhs: TreeNode<T>, rhs: TreeNode<T>) -> Bool {
        lhs.value < rhs.value
    }

    func equal(to node: TreeNode<T>) -> Bool {
        id == node.id
    }

    func notEqual(to node: TreeNode<T>) -> Bool {
        id != node.id
    }
}

extension TreeNode: CustomStringConvertible where T: CustomStringConvertible {
    var description: String { value.description }
}
