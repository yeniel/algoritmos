import UIKit

extension LinkedList {
    func reverse(sublistHead: ListNode<T>?, sublistCount: Int) -> ListNode<T>? {
        if sublistHead == nil {
            return nil
        }

        var current: ListNode<T>? = sublistHead
        var next: ListNode<T>?
        var previous: ListNode<T>?
        var count = 0

        while count < sublistCount, current != nil {
            next = current?.next
            current?.next = previous
            previous = current
            current = next
            count += 1
        }

        if let next = next {
            sublistHead?.next = reverse(sublistHead: next, sublistCount: sublistCount)
        }

        return previous
    }

    func reverseOptimized(sublistHead: ListNode<T>?, sublistCount: Int, dummyValue: T) -> ListNode<T>? {
        if sublistHead == nil, sublistHead?.next == nil {
            return sublistHead
        }

        let dummy = ListNode(value: dummyValue)

        dummy.next = sublistHead

        var previous: ListNode<T>? = dummy
        var current: ListNode<T>? = dummy
        var next: ListNode<T>? = dummy

        var count = 0

        while current != nil {
            count += 1
            current = current?.next
        }

        while next != nil {
            current = previous?.next
            next = current?.next

            let toLoop = count > sublistCount ? sublistCount : count - 1

            for _ in (1..<toLoop) {
                current?.next = next?.next
                next?.next = previous?.next
                previous?.next = next
                next = current?.next
            }

            previous = current
            count -= sublistCount
        }

        return dummy.next
    }
}

let list = LinkedList<Int>()
let listValues = [1, 2, 3, 4, 5, 6, 7, 8, 9]

listValues.forEach { list.append(value: $0)}

list.head = list.reverse(sublistHead: list.head, sublistCount: 3)

print(list)
print("Output should be: 3, 2, 1, 6, 5, 4, 9, 8, 7")

list.head = nil

listValues.forEach { list.append(value: $0)}

list.head = list.reverseOptimized(sublistHead: list.head, sublistCount: 3, dummyValue: -1)

print(list)
print("Output should be: 3, 2, 1, 6, 5, 4, 9, 8, 7")

