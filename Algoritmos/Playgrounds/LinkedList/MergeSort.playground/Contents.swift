import UIKit

extension LinkedList {
    func mergeSort() -> LinkedList<T> {
        let head = mergeSort(head: head)

        return LinkedList(head: head)
    }

    func mergeSort(head: ListNode<T>?) -> ListNode<T>? {
       if head == nil || head?.next == nil {
            return head
        }

        var middle = getMiddle(head: head)
        var nextOfMiddle = middle?.next

        middle?.next = nil

        var leftHead = mergeSort(head: head)
        var rightHead = mergeSort(head: nextOfMiddle)
        var sortedListHead = sortedMerge(leftHead: leftHead, rightHead: rightHead)

        return sortedListHead
    }

    func sortedMerge(leftHead: ListNode<T>?, rightHead: ListNode<T>?) -> ListNode<T>? {
        var result: ListNode<T>?

        guard let leftHead = leftHead else {
            return rightHead
        }

        guard let rightHead = rightHead else {
            return leftHead
        }

        if leftHead <= rightHead {
            result = leftHead
            result?.next = sortedMerge(leftHead: leftHead.next, rightHead: rightHead)
        } else {
            result = rightHead
            result?.next = sortedMerge(leftHead: leftHead, rightHead: rightHead.next)
        }

        return result
    }

    func mergeSort2() -> LinkedList<T> {
        let head = mergeSort2(head: head)

        return LinkedList(head: head)
    }

    func mergeSort2(head: ListNode<T>?) -> ListNode<T>? {
        if head == nil || head?.next == nil {
            return head
        }

        var middle = getMiddle(head: head)
        var nextOfMiddle = middle?.next

        middle?.next = nil

        var leftHead = mergeSort2(head: head)
        var rightHead = mergeSort2(head: nextOfMiddle)
        var sortedHead = sortedMerge2(leftHead: leftHead, rightHead: rightHead)

        return sortedHead

    }

    func sortedMerge2(leftHead left: ListNode<T>?, rightHead right: ListNode<T>?) -> ListNode<T>? {
        guard let minValue = min else {
            return nil
        }

        var merged = ListNode<T>(value: minValue)
        var temp: ListNode<T>? = merged
        var leftHead = left
        var rightHead = right

        while let lhs = leftHead, let rhs = rightHead {
            if lhs < rhs {
                temp?.next = leftHead
                leftHead = leftHead?.next
            } else {
                temp?.next = rightHead
                rightHead = rightHead?.next
            }

            temp = temp?.next
        }

        while leftHead != nil {
            temp?.next = leftHead
            leftHead = leftHead?.next
            temp = temp?.next
        }

        while rightHead != nil {
            temp?.next = rightHead
            rightHead = rightHead?.next
            temp = temp?.next
        }

        return merged.next
    }

    func getMiddle(head: ListNode<T>?) -> ListNode<T>? {
        var slowCurrent = head
        var fastCurrent = head?.next

        while fastCurrent != nil, fastCurrent?.next != nil {
            slowCurrent = slowCurrent?.next
            fastCurrent = fastCurrent?.next?.next
        }

        return slowCurrent
    }
}

var list = LinkedList<Int>()

list.append(value: 50)
list.append(value: 20)
list.append(value: 15)
list.append(value: 4)
list.append(value: 10)

let sortedList = list.mergeSort()

print(sortedList)
print("Output should be: 4, 10, 15, 20, 50")

var list2 = LinkedList<Int>()

list2.min = Int.min

list2.append(value: 50)
list2.append(value: 20)
list2.append(value: 15)
list2.append(value: 4)
list2.append(value: 10)

let sortedList2 = list2.mergeSort2()

print(sortedList2)
print("Output should be: 4, 10, 15, 20, 50")
