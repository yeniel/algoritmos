import UIKit

extension LinkedList {
    func deleteNode(withValue valueToDelete: Int) -> String {
        guard var current = head else {
            return "Can't delete the node, the list is empty"
        }

        if current.value == valueToDelete {
            guard let next = current.next else {
                return "Can't delete the node as it has only one node"
            }

            head = next

            return "Node deleted"
        }

        var previous = current

        while var next = current.next, current.value != valueToDelete {
            previous = current
            current = next
        }

        guard let next = current.next else {
            if current.value == valueToDelete {
                previous.next = nil

                return "Node deleted"
            } else {
                return "Can't delete the node as it doesn't exist"
            }
        }

        previous.next = next

        return "Node deleted"
    }

    func push(node newNode: ListNode) {
        newNode.next = head
        head = newNode
    }
}

let linkedList = LinkedList()
var result: String

print("Deleting in empty list")
result = linkedList.deleteNode(withValue: 10)
print(result)
print("Output should be: Can't delete the node, the list is empty")

linkedList.push(node: ListNode(id: "3"))
linkedList.push(node: ListNode(id: "2"))
linkedList.push(node: ListNode(id: "6"))
linkedList.push(node: ListNode(id: "5"))
linkedList.push(node: ListNode(id: "11"))
linkedList.push(node: ListNode(id: "10"))
linkedList.push(node: ListNode(id: "15"))
linkedList.push(node: ListNode(id: "12"))

print("\nDeleting node 10")
result = linkedList.deleteNode(withValue: 10)
print(result)
print("Output should be: Node deleted")

print("\nDeleting first node")
result = linkedList.deleteNode(withValue: 12)
print(result)
print("Output should be: Node deleted")

print("\nDeleting non existent node")
result = linkedList.deleteNode(withValue: 13)
print(result)
print("Output should be: Can't delete the node as it doesn't exist")

print("\nDeleting last node")
result = linkedList.deleteNode(withValue: 3)
print(result)
print("Output should be: Node deleted")

print("\nDeleting node when list has only one node")
result = linkedList.deleteNode(withValue: 2)
result = linkedList.deleteNode(withValue: 6)
result = linkedList.deleteNode(withValue: 5)
result = linkedList.deleteNode(withValue: 11)
result = linkedList.deleteNode(withValue: 15)
print(result)
print("Output should be: Can't delete the node as it has only one node")
