import UIKit

extension LinkedList {
    func sortedInsert(node newNode: ListNode<T>) {
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

    func insertFirst(newNode: ListNode<T>) {
        newNode.next = head
        head = newNode
    }
}

let linkedList = LinkedList<Int>()

linkedList.sortedInsert(node: ListNode(value: 5))
linkedList.sortedInsert(node: ListNode(value: 10))
linkedList.sortedInsert(node: ListNode(value: 7))
linkedList.sortedInsert(node: ListNode(value: 3))
linkedList.sortedInsert(node: ListNode(value: 1))
linkedList.sortedInsert(node: ListNode(value: 9))

print(linkedList)
print("Outout should be: 1, 3, 5, 7, 9, 10")
