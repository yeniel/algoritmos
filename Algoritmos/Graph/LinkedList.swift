//
//  LinkedList.swift
//  Algoritmos
//
//  Created by Yeniel Landestoy on 22/1/23.
//

import Foundation

class LinkedList<T: Comparable> {
    var head: ListNode<T>?

    func append(value: T) {
        let node = ListNode(value: value)

        guard var current = head else {
            head = node

            return
        }

        while let next = current.next {
            current = next
        }

        current.next = node
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
}

extension ListNode: CustomStringConvertible where T: CustomStringConvertible {
    var description: String { value.description }
}
