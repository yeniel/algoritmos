import UIKit

extension Tree where T: CustomStringConvertible {
    // Time Complexity: Inorder and Preorder traversals of Binary Tree take O(n) time. The function strstr() can also be implemented in O(n) time using the KMP string matching algorithm.
    // Auxiliary Space: O(n)
    func isSubTree(tree: Tree<T>?) -> Bool {
        guard let subTree = tree, !subTree.isEmpty else {
            return false
        }

        let subTreeInOrder = subTree.inOrder()
        let selfInOrder = inOrder()

        if !selfInOrder.contains(subTreeInOrder) {
            return false
        }

        let subTreePreOrder = subTree.preOrder()
        let selfPreOrder = preOrder()

        return selfPreOrder.contains(subTreePreOrder)
    }

    func inOrder() -> String {
        return inOrderUtil(node: root)
    }

    private func inOrderUtil(node: TreeNode<T>?) -> String {
        guard let node = node else {
            return ""
        }

        var result = inOrderUtil(node: node.left)

        result += node.value.description
        result += inOrderUtil(node: node.right)

        return result
    }

    func preOrder() -> String {
        return preOrderUtil(node: root)
    }

    private func preOrderUtil(node: TreeNode<T>?) -> String {
        guard let node = node else {
            return ""
        }

        var result = node.value.description

        result += inOrderUtil(node: node.left)
        result += inOrderUtil(node: node.right)

        return result
    }
}

let tree = Tree<String>()
let subTree = Tree<String>()
var result: Bool

tree.root = TreeNode(value: "a")
tree.root?.left = TreeNode(value: "b")
tree.root?.right = TreeNode(value: "d")
tree.root?.left?.left = TreeNode(value: "c")
tree.root?.right?.right = TreeNode(value: "e")

subTree.root = TreeNode(value: "a")
subTree.root?.left = TreeNode(value: "b")
subTree.root?.left?.left = TreeNode(value: "c")
subTree.root?.right = TreeNode(value: "d")

result = tree.isSubTree(tree: subTree)
print(result)
print("Output should be: true")
