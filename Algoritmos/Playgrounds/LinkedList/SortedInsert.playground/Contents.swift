import UIKit

extension LinkedList {
    func sortedInsert(newNode: ListNode) {
        guard let head = head else {
            insertFirst(newNode: newNode)
            return
        }

        if head >= newNode {
            insertFirst(newNode: newNode)
            return
        }

        var current = head

        while let next = current.next, next < newNode {
            current = next
        }

        newNode.next = current.next
        current.next = newNode
    }

    func insertFirst(newNode: ListNode) {
        newNode.next = head
        head = newNode
    }
}

let linkedList = LinkedList()

linkedList.sortedInsert(newNode: ListNode(id: "5"))
linkedList.sortedInsert(newNode: ListNode(id: "10"))
linkedList.sortedInsert(newNode: ListNode(id: "7"))
linkedList.sortedInsert(newNode: ListNode(id: "3"))
linkedList.sortedInsert(newNode: ListNode(id: "1"))
linkedList.sortedInsert(newNode: ListNode(id: "9"))

print(linkedList.description)
