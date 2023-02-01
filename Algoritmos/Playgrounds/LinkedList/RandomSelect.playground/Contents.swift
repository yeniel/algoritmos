import UIKit

extension LinkedList {
    func randomSelect() -> ListNode<T>? {
        if head == nil {
            return nil
        }

        var result = head
        var current = head
        var count = 2

        while current != nil {
            if Int.random(in: 0..<count) == 0 {
                result = current
            }

            current = current?.next
            count += 1
        }

        return result
    }
}

let list = LinkedList<Int>()

list.append(value: 5)
list.append(value: 20)
list.append(value: 4)
list.append(value: 3)
list.append(value: 30)

let randomSelect = list.randomSelect()

print(randomSelect ?? "")

