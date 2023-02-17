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

    var min: T

    var neutral: T

    init(root: TreeNode<T>? = nil, min: T, neutral: T) {
        self.root = root
        self.min = min
        self.neutral = neutral
    }
}

extension Tree: CustomStringConvertible where T: CustomStringConvertible {
    var description: String {
        guard var _ = root else {
            return "Empty"
        }

        return String(inOrderDescription(node: root).dropLast(3))
    }

    private func inOrderDescription(node: TreeNode<T>?) -> String {
        guard let node = node else {
            return ""
        }

        var result = inOrderDescription(node: node.left)

        result += node.value.description + " - "
        result += inOrderDescription(node: node.right)

        return result
    }
}

extension Tree where T == Int {
    convenience init() {
        self.init(min: Int.min, neutral: 0)
    }
}

extension Tree where T == String {
    convenience init() {
        self.init(min: "", neutral: "")
    }
}

class TreeNode<T: Comparable>: Identifiable, Equatable, Comparable {
    let id = UUID()
    var value: T
    var left: TreeNode?
    var right: TreeNode?
    var horizontalDistance: Int

    var isLeaf: Bool {
        left == nil && right == nil
    }

    var isNotLeaf: Bool { !isLeaf }

    init(value: T, left: TreeNode? = nil, right: TreeNode? = nil, horizontalDistance: Int? = 0) {
        self.value = value
        self.left = left
        self.right = right
        self.horizontalDistance = horizontalDistance ?? 0
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
