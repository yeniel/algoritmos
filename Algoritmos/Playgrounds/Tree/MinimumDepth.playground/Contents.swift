import UIKit

extension Tree {
    // Time Complexity: O(n), as it traverses the tree only once.
    // Auxiliary Space: O(h), where h is the height of the tree, this space is due to the recursive call stack.
    func minimumDepth1() -> Int {
        minimumDepth1Util(root: root)
    }

    func minimumDepth1Util(root: TreeNode<T>?) -> Int {
        guard let root = root else {
            return 0
        }

        if root.left == nil, root.right == nil {
            return 1
        }

        guard let left = root.left else {
            return 1 + minimumDepth1Util(root: root.right)
        }

        guard let right = root.right else {
            return 1 + minimumDepth1Util(root: root.left)
        }

        return 1 + Swift.min(minimumDepth1Util(root: left), minimumDepth1Util(root: right))
    }

    // Time Complexity: O(n), where n is the number of nodes in the given binary tree. This is due to the fact that we are visiting each node once.
    // Auxiliary Space: O(n), as we need to store the elements in a queue for level order traversal.
    func minimumDepth2() -> Int {
        guard let root = root else {
            return 0
        }

        var queue: [QueueItem<T>] = []
        var queueItem = QueueItem<T>(node: root, depth: 1)

        queue.append(queueItem)

        while queue.count != 0 {
            queueItem = queue.removeFirst()

            let node = queueItem.node
            let depth = queueItem.depth

            if node.left == nil, node.right == nil {
                return depth
            }

            if let left = node.left {
                queueItem.node = left
                queueItem.depth = depth + 1
                queue.append(queueItem)
            }

            if let right = node.right {
                queueItem.node = right
                queueItem.depth = depth + 1
                queue.append(queueItem)
            }
        }

        return 0
    }
}

struct QueueItem<T: Comparable> {
    var node: TreeNode<T>
    var depth: Int
}

let tree = Tree<Int>()

tree.root = TreeNode(value: 1)
tree.root?.left = TreeNode(value: 2)
tree.root?.right = TreeNode(value: 3)
tree.root?.left?.left = TreeNode(value: 4)
tree.root?.left?.right = TreeNode(value: 5)

var result = tree.minimumDepth1()

print(result)
print("Output should be: 2\n")

result = tree.minimumDepth2()

print(result)
print("Output should be: 2\n")
