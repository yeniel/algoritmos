import UIKit

extension LinkedList {
    func removeLoop() {
        if head == nil || head?.next == nil {
            return
        }

        var slowCurrent = head?.next
        var fastCurrent = head?.next?.next

        while fastCurrent != nil, fastCurrent?.next != nil {
            if slowCurrent == fastCurrent {
                break
            }

            slowCurrent = slowCurrent?.next
            fastCurrent = fastCurrent?.next?.next
        }

        if slowCurrent == fastCurrent {
            slowCurrent = head

            if slowCurrent != fastCurrent {
                while slowCurrent?.next != fastCurrent?.next {
                    slowCurrent = slowCurrent?.next
                    fastCurrent = fastCurrent?.next
                }

                fastCurrent?.next = nil
            } else {
                while fastCurrent?.next != slowCurrent {
                    fastCurrent = fastCurrent?.next
                }

                fastCurrent?.next = nil
            }
        }
    }
}

var list = LinkedList<Int>()

list.append(value: 50)
list.append(value: 20)
let node1 = list.append(value: 15)
list.append(value: 4)
let node2 = list.append(value: 10)

node2.next = node1

list.removeLoop()

print(list)
print("Output should be: 50, 20, 15, 4, 10")
