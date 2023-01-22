//
//  LinkedList.swift
//  Algoritmos
//
//  Created by Yeniel Landestoy on 22/1/23.
//

import Foundation

class LinkedList {
    var head: ListNode?

    var description: String {
        var current = head
        var result = ""

        while let safeCurrent = current {
            result += String(safeCurrent.value) + ", "
            current = safeCurrent.next
        }

        return String(result.prefix(result.count - 1))
    }
}

class ListNode: Identifiable, Equatable, Comparable {
    let id: String
    let value: Int
    var next: ListNode?

    init(id: String, value: Int, next: ListNode? = nil) {
        self.id = id
        self.value = value
        self.next = next
    }

    convenience init(id: String) {
        self.init(id: id, value: Int(id) ?? 0)
    }

    static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs.id == rhs.id
    }

    static func < (lhs: ListNode, rhs: ListNode) -> Bool {
        lhs.value < rhs.value
    }
}
