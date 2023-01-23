import UIKit

func sumLists() {
    if list1.isEmpty {
        result = list2
        return
    }

    if list2.isEmpty {
        result = list1
        return
    }

    if list1.count == list2.count {
        addSameSize(head1: list1.head, head2: list2.head)
    } else {
        firstOperandShouldbeGraterThanSecond()

        let current = getCurrent()

        addSameSize(head1: current, head2: list2.head)
        sumRemainingList1AndCarry(head1: list1.head, current: current)
    }

    sumRemainingCarry()
}

func addSameSize(head1: ListNode<Int>?, head2: ListNode<Int>?) {
    guard let current1 = head1, let current2 = head2 else {
        return
    }

    addSameSize(head1: current1.next, head2: current2.next)

    let sum = current1.value + current2.value + carry

    pushSumToResult(sum: sum)
}

func firstOperandShouldbeGraterThanSecond() {
    if list1.count < list2.count {
        let temp = list1

        list1 = list2
        list2 = temp
    }
}

func sumRemainingList1AndCarry(head1: ListNode<Int>?, current: ListNode<Int>) {
    if let head1 = head1, head1.notEqual(to: current) {
        sumRemainingList1AndCarry(head1: head1.next, current: current)

        let sum = carry + head1.value

        pushSumToResult(sum: sum)
    }
}

func pushSumToResult(sum: Int) {
    carry = sum / 10

    let resultDigit = sum % 10

    result.push(value: resultDigit)
}

/*
Node of list1 that are in the same digit of list2 head
 */
func getCurrent() -> ListNode<Int> {
    var diff = abs(list1.count - list2.count)
    var current = ListNode(value: 0)

    guard var temp = list1.head else {
        return current
    }

    while diff >= 0 {
        diff -= 1
        current = temp
        temp = temp.next ?? ListNode(value: 0)
    }

    return current
}

func sumRemainingCarry() {
    if carry > 0 {
        result.push(value: carry)
    }
}

func reset() {
    list1 = LinkedList<Int>()
    list2 = LinkedList<Int>()
    result = LinkedList<Int>()
    carry = 0
}

var list1 = LinkedList<Int>()
var list2 = LinkedList<Int>()
var carry: Int = 0
var result = LinkedList<Int>()
var list1Number: [Int] = []
var list2Number: [Int] = []

sumLists()

print(result)

reset()
list1Number = [1];
list1Number.forEach { list1.append(value: $0) }

sumLists()

print(result)
print("Output should be: 1")
print("----")

reset()
list2Number = [2];
list2Number.forEach { list2.append(value: $0) }

sumLists()

print(result)
print("Output should be: 2")
print("----")

reset()
list1Number = [1];
list1Number.forEach { list1.append(value: $0) }
list2Number = [2];
list2Number.forEach { list2.append(value: $0) }

sumLists()

print(result)
print("Output should be: 3")
print("----")

reset()
list1Number = [5];
list1Number.forEach { list1.append(value: $0) }
list2Number = [6];
list2Number.forEach { list2.append(value: $0) }

sumLists()

print(result)
print("Output should be: 1, 1")
print("----")

reset()
list1Number = [5];
list1Number.forEach { list1.append(value: $0) }
list2Number = [1, 0];
list2Number.forEach { list2.append(value: $0) }

sumLists()

print(result)
print("Output should be: 1, 5")
print("----")

reset()
list1Number = [1, 5];
list1Number.forEach { list1.append(value: $0) }
list2Number = [6];
list2Number.forEach { list2.append(value: $0) }

sumLists()

print(result)
print("Output should be: 2, 1")
print("----")

reset()
list1Number = [9, 9, 9];
list1Number.forEach { list1.append(value: $0) }
list2Number = [1, 8];
list2Number.forEach { list2.append(value: $0) }

sumLists()

print(result)
print("Output should be: 1, 0, 1, 7")
print("----")
