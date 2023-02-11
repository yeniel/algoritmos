import UIKit

extension Tree {
    // Time complexity: O(n) where n is number of nodes in given binary tree.
    // Auxiliary Space: O(n) for call stack since using recursion
    func isFull() -> Bool {
        isFullUtil(node: root)
    }

    private func isFullUtil(node: TreeNode<T>?) -> Bool {
        guard let node = node else {
            return true
        }

        if node.left == nil, node.right == nil {
            return true
        }

        if node.left != nil, node.right != nil {
            return isFullUtil(node: node.left) && isFullUtil(node: node.right)
        }

        return false
    }

    // Time Complexity: O(N), Where N is the total nodes in a given binary tree.
    // Auxiliary Space: O(N), in most cases the last level contains nodes as half of the total nodes. O(N/2) ~ O(N)
    func isFull2() -> Bool {
        guard let root = root else {
            return true
        }

        var queue: [TreeNode?] = [root]
        var node: TreeNode<T>?

        while !queue.isEmpty {
            node = queue.removeFirst()

            guard let node = node else {
                return false
            }

            if node.isNotLeaf {
                queue.append(node.left)
                queue.append(node.right)
            }
        }

        return true
    }
}

let tree = Tree<Int>()
var result: Bool

tree.root = TreeNode(value: 10)
tree.root?.left = TreeNode(value: 20)
tree.root?.right = TreeNode(value: 30)
tree.root?.left?.right = TreeNode(value: 40)
tree.root?.left?.left = TreeNode(value: 50)
tree.root?.right?.left = TreeNode(value: 60)
tree.root?.left?.left?.left = TreeNode(value: 80)
tree.root?.right?.right = TreeNode(value: 70)
tree.root?.left?.left?.right = TreeNode(value: 90)
tree.root?.left?.right?.left = TreeNode(value: 80)
tree.root?.left?.right?.right = TreeNode(value: 90)
tree.root?.right?.left?.left = TreeNode(value: 80)
tree.root?.right?.left?.right = TreeNode(value: 90)
tree.root?.right?.right?.left = TreeNode(value: 80)
tree.root?.right?.right?.right = TreeNode(value: 90)

result = tree.isFull()

print(result)
print("Output should be: true\n")

result = tree.isFull2()

print(result)
print("Output should be: true\n")
