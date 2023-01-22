import UIKit

extension LinkedList {
    func sortedInsert(node newNode: ListNode) {
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

linkedList.sortedInsert(node: ListNode(id: "5"))
linkedList.sortedInsert(node: ListNode(id: "10"))
linkedList.sortedInsert(node: ListNode(id: "7"))
linkedList.sortedInsert(node: ListNode(id: "3"))
linkedList.sortedInsert(node: ListNode(id: "1"))
linkedList.sortedInsert(node: ListNode(id: "9"))

print(linkedList)
print("Outout should be: 1, 3, 5, 7, 9, 10")
