import UIKit

extension LinkedList {
    func intersection(list: LinkedList<T>) -> LinkedList {
        var intersectionList = LinkedList<T>()
        var selfCurrent = head

        while selfCurrent != nil {
            if let current = selfCurrent, list.exist(value: current.value) {
                intersectionList.push(value: current.value)
            }

            selfCurrent = selfCurrent?.next
        }

        return intersectionList
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

let intersection = list1.intersection(list: list2)

print(intersection)
print("Output should be: 4, 10")
