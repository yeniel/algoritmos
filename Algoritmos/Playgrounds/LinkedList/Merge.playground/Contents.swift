import UIKit

extension LinkedList {
    func merge(list: LinkedList<T>?) {
        var selfCurrent = head
        var listCurrent = list?.head
        var selfNext: ListNode<T>?
        var listNext: ListNode<T>?

        while selfCurrent != nil, listCurrent != nil {
            selfNext = selfCurrent?.next
            listNext = listCurrent?.next

            listCurrent?.next = selfNext
            selfCurrent?.next = listCurrent

            selfCurrent = selfNext
            listCurrent = listNext
        }

        list?.head = listCurrent
    }
}

let list1 = LinkedList<Int>()
let list2 = LinkedList<Int>()
let list1Values = [3, 2, 1]
let list2Values = [8, 7, 6, 5, 4]


list1Values.forEach { list1.push(value: $0) }
list2Values.forEach { list2.push(value: $0) }

list1.merge(list: list2)

print(list1)
print(list2)

print("Output should be: \n1, 4, 2, 5, 3, 6\n7, 8")
