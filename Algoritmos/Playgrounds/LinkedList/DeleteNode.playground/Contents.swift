import UIKit

extension LinkedList {
    func deleteNode(withValue valueToDelete: T) -> String {
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
}

let linkedList = LinkedList<Int>()
var result: String

print("Deleting in empty list")
result = linkedList.deleteNode(withValue: 10)
print(result)
print("Output should be: Can't delete the node, the list is empty")

linkedList.push(value: 3)
linkedList.push(value: 2)
linkedList.push(value: 6)
linkedList.push(value: 5)
linkedList.push(value: 11)
linkedList.push(value: 10)
linkedList.push(value: 15)
linkedList.push(value: 12)

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
