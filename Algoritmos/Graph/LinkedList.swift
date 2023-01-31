//
//  LinkedList.swift
//  Algoritmos
//
//  Created by Yeniel Landestoy on 22/1/23.
//

import Foundation

class LinkedList<T: Comparable> {
    var head: ListNode<T>?

    var isEmpty: Bool { head == nil }

    var count: Int {
        var current = head
        var counter = 0

        while current != nil {
            counter += 1
            current = current?.next
        }

        return counter
    }

    @discardableResult
    func append(value: T) -> ListNode<T> {
        let node = ListNode(value: value)

        guard var current = head else {
            head = node

            return node
        }

        while let next = current.next {
            current = next
        }

        current.next = node

        return node
    }

    func push(value: T) {
        let newNode = ListNode(value: value)

        newNode.next = head
        head = newNode
    }

    func exist(value: T) -> Bool {
        var current = head

        while current != nil {
            if current?.value == value {
                return true
            }

            current = current?.next
        }

        return false
    }

    func notExist(value: T) -> Bool {
        !exist(value: value)
    }
}

extension LinkedList: CustomStringConvertible where T: CustomStringConvertible {
    var description: String {
        guard var current = head else {
            return "Empty"
        }
        var result = current.value.description

        while let next = current.next {
            result +=  ", " + next.value.description
            current = next
        }

        return result
    }
}

class ListNode<T: Comparable>: Identifiable, Equatable, Comparable {
    let id = UUID()
    let value: T
    var next: ListNode?

    init(value: T, next: ListNode? = nil) {
        self.value = value
        self.next = next
    }

    static func == <T: Comparable>(lhs: ListNode<T>, rhs: ListNode<T>) -> Bool {
        return lhs.value == rhs.value
    }

    static func < <T: Comparable>(lhs: ListNode<T>, rhs: ListNode<T>) -> Bool {
        lhs.value < rhs.value
    }

    func equal(to node: ListNode<T>) -> Bool {
        return id == node.id
    }

    func notEqual(to node: ListNode<T>) -> Bool {
        return id != node.id
    }
}

extension ListNode: CustomStringConvertible where T: CustomStringConvertible {
    var description: String { value.description }
}
