import UIKit

extension Tree {
    // Time Complexity: O(n), As it does two inorder traversals of the binary tree.
    // Auxiliary Space: O(n), The extra space is used to store the odd level nodes of the tree and in recursive function call stack which is O(h), where h is the height of the tree.
    func reverseAlternateLevels() {
        var alternateLevelNodes: [T] = Array(repeating: neutral, count: 100)
        var index: Int = 0

        storeAlternate(
            node: root,
            alternateLevelNodes: &alternateLevelNodes,
            level: 0,
            index: &index
        )

        reverse(alternateLevelNodes: &alternateLevelNodes, index: &index)
        index = 0

        modifyTree(
            node: root,
            alternateLevelNodes: &alternateLevelNodes,
            level: 0,
            index: &index
        )
    }

    private func storeAlternate(
        node: TreeNode<T>?,
        alternateLevelNodes: inout [T],
        level: Int,
        index: inout Int
    ) {
        guard let node = node else {
            return
        }

        storeAlternate(
            node: node.left,
            alternateLevelNodes: &alternateLevelNodes,
            level: level + 1,
            index: &index
        )

        if level % 2 != 0 {
            alternateLevelNodes[index] = node.value
            index += 1
        }

        storeAlternate(
            node: node.right,
            alternateLevelNodes: &alternateLevelNodes,
            level: level + 1,
            index: &index
        )
    }

    private func modifyTree(
        node: TreeNode<T>?,
        alternateLevelNodes: inout [T],
        level: Int,
        index: inout Int
    ) {
        guard let node = node else {
            return
        }

        modifyTree(
            node: node.left,
            alternateLevelNodes: &alternateLevelNodes,
            level: level + 1,
            index: &index
        )

        if level % 2 != 0 {
            node.value = alternateLevelNodes[index]
            index += 1
        }

        modifyTree(
            node: node.right,
            alternateLevelNodes: &alternateLevelNodes,
            level: level + 1,
            index: &index
        )
    }

    private func reverse(alternateLevelNodes: inout [T], index: inout Int) {
        var leftIndex = 0
        var rightIndex = index - 1

        while leftIndex < rightIndex {
            let temp = alternateLevelNodes[leftIndex]
            alternateLevelNodes[leftIndex] = alternateLevelNodes[rightIndex]
            alternateLevelNodes[rightIndex] = temp
            leftIndex += 1
            rightIndex -= 1
        }
    }

    // Time Complexity: O(N)
    // Auxiliary Space: O(log N), this is due to the recursive call stack.
    func reverseAlternateLevels2() {
        preOrder(node1: root?.left, node2: root?.right, level: 0)
    }

    private func preOrder(node1: TreeNode<T>?, node2: TreeNode<T>?, level: Int) {
        guard let node1 = node1 else {
            return
        }

        guard let node2 = node2 else {
            return
        }

        if level % 2 == 0 {
            let temp = node1.value
            node1.value = node2.value
            node2.value = temp
        }

        preOrder(node1: node1.left, node2: node2.right, level: level + 1)
        preOrder(node1: node1.right, node2: node2.left, level: level + 1)
    }
}

let tree = Tree<String>()

tree.root = TreeNode(value: "a")
tree.root?.left = TreeNode(value: "b")
tree.root?.right = TreeNode(value: "c")
tree.root?.left?.left = TreeNode(value: "d")
tree.root?.left?.right = TreeNode(value: "e")
tree.root?.right?.left = TreeNode(value: "f")
tree.root?.right?.right = TreeNode(value: "g")
tree.root?.left?.left?.left = TreeNode(value: "h")
tree.root?.left?.left?.right = TreeNode(value: "i")
tree.root?.left?.right?.left = TreeNode(value: "j")
tree.root?.left?.right?.right = TreeNode(value: "k")
tree.root?.right?.left?.left = TreeNode(value: "l")
tree.root?.right?.left?.right = TreeNode(value: "m")
tree.root?.right?.right?.left = TreeNode(value: "n")
tree.root?.right?.right?.right = TreeNode(value: "o")

tree.reverseAlternateLevels()
print(tree)
print("Output should be: o - d - n - c - m - e - l - a - k - f - j - b - i - g - h\n")

tree.root = TreeNode(value: "a")
tree.root?.left = TreeNode(value: "b")
tree.root?.right = TreeNode(value: "c")
tree.root?.left?.left = TreeNode(value: "d")
tree.root?.left?.right = TreeNode(value: "e")
tree.root?.right?.left = TreeNode(value: "f")
tree.root?.right?.right = TreeNode(value: "g")
tree.root?.left?.left?.left = TreeNode(value: "h")
tree.root?.left?.left?.right = TreeNode(value: "i")
tree.root?.left?.right?.left = TreeNode(value: "j")
tree.root?.left?.right?.right = TreeNode(value: "k")
tree.root?.right?.left?.left = TreeNode(value: "l")
tree.root?.right?.left?.right = TreeNode(value: "m")
tree.root?.right?.right?.left = TreeNode(value: "n")
tree.root?.right?.right?.right = TreeNode(value: "o")

tree.reverseAlternateLevels2()
print(tree)
print("Output should be: o - d - n - c - m - e - l - a - k - f - j - b - i - g - h")

