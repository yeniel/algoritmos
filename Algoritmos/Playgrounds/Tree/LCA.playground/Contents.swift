import UIKit

extension Tree {
    // Time Complexity: O(H). where H is the height of the tree.
    // Auxiliary Space: O(H), If recursive stack space is ignored, the space complexity of the above solution is constant.
    func lca(value1: T, value2: T) -> TreeNode<T>? {
        return lcaUtil(currentNode: root, value1: value1, value2: value2)
    }

    private func lcaUtil(currentNode: TreeNode<T>?, value1: T, value2: T) -> TreeNode<T>? {
        guard let currentNode = currentNode else {
            return nil
        }

        if currentNode.value > value1, currentNode.value > value2 {
            return lcaUtil(currentNode: currentNode.left, value1: value1, value2: value2)
        }

        if currentNode.value < value1, currentNode.value < value2 {
            return lcaUtil(currentNode: currentNode.right, value1: value1, value2: value2)
        }

        return currentNode
    }

    // Time Complexity: O(H). where H is the height of the tree
    // Auxiliary Space: O(1). The space complexity of the above solution is constant.
    func lcaIterative(value1: T, value2: T) -> TreeNode<T>? {
        return lcaIterativeUtil(root: root, value1: value1, value2: value2)
    }

    private func lcaIterativeUtil(root: TreeNode<T>?, value1: T, value2: T) -> TreeNode<T>? {
        var currentNode = root

        while let node = currentNode {
            if node.value > value1, node.value > value2 {
                currentNode = node.left
            } else if node.value < value1, node.value < value2 {
                currentNode = node.right
            } else {
                break
            }
        }

        return currentNode
    }
}

let tree = Tree<Int>()
var result: TreeNode<Int>?
var value1: Int
var value2: Int

tree.root = TreeNode(value: 20);
tree.root?.left = TreeNode(value: 8);
tree.root?.right = TreeNode(value: 22);
tree.root?.left?.left = TreeNode(value: 4);
tree.root?.left?.right = TreeNode(value: 12);
tree.root?.left?.right?.left = TreeNode(value: 10);
tree.root?.left?.right?.right = TreeNode(value: 14);

value1 = 10
value2 = 14
result = tree.lca(value1: value1, value2: value2)

print(result ?? "nil")
print("Output should be: 12\n")

value1 = 14
value2 = 8
result = tree.lca(value1: value1, value2: value2)

print(result ?? "nil")
print("Output should be: 8\n")

value1 = 10
value2 = 22
result = tree.lca(value1: value1, value2: value2)

print(result ?? "nil")
print("Output should be: 20\n")

value1 = 10
value2 = 14
result = tree.lcaIterative(value1: value1, value2: value2)

print(result ?? "nil")
print("Output should be: 12\n")

value1 = 14
value2 = 8
result = tree.lcaIterative(value1: value1, value2: value2)

print(result ?? "nil")
print("Output should be: 8\n")

value1 = 10
value2 = 22
result = tree.lcaIterative(value1: value1, value2: value2)

print(result ?? "nil")
print("Output should be: 20\n")
