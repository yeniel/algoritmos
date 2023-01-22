import UIKit

extension LinkedList {
    func compare(to list: LinkedList?) -> Int {
        guard let list = list else {
            return 1
        }

        var selfCurrent: ListNode? = head
        var listCurrent: ListNode? = list.head

        while selfCurrent != nil, listCurrent != nil, selfCurrent == listCurrent {
            selfCurrent = selfCurrent?.next
            listCurrent = listCurrent?.next
        }

        if let selfCurrent = selfCurrent, let listCurrent = listCurrent {
            if selfCurrent > listCurrent {
                return 1
            } else {
                return -1
            }
        }

        if selfCurrent != nil, listCurrent == nil {
            return 1
        }

        if selfCurrent == nil, listCurrent != nil {
            return -1
        }

        return 0
    }
}

var linkedList = LinkedList<String>()

linkedList.append(value: "G")
linkedList.append(value: "O")
linkedList.append(value: "2")

var linkedListToCompare = LinkedList<String>()

linkedListToCompare.append(value: "G")
linkedListToCompare.append(value: "O")
linkedListToCompare.append(value: "1")

let result = linkedList.compare(to: linkedListToCompare)

print(result)
print("Outout should be: 1")
