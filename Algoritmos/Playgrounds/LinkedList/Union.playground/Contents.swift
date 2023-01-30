import UIKit

extension LinkedList {
    func union(list: LinkedList<T>) -> LinkedList {
        var selfCurrent = head
        var listCurrent = list.head
        var unionList = LinkedList<T>()

        while selfCurrent != nil {
            if let current = selfCurrent {
                unionList.push(value: current.value)
                selfCurrent = current.next
            }
        }

        while listCurrent != nil {
            if let current = listCurrent, notExist(value: current.value) {
                unionList.push(value: current.value)
            }

            listCurrent = listCurrent?.next
        }

        return unionList
    }
}

let list1 = LinkedList<Int>()

list1.push(value: 20)
list1.push(value: 4)
list1.push(value: 15)
list1.push(value: 10)

let list2 = LinkedList<Int>()

list2.push(value: 10)
list2.push(value: 2)
list2.push(value: 4)
list2.push(value: 8)

let union = list1.union(list: list2)

print(union)
print("Output should be: 2, 8, 20, 4, 15, 10")
