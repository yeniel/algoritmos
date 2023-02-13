import UIKit

extension Tree {
    // Time complexity of the above solution is O(n) where n is number of nodes in given Binary Tree.
    // Auxiliary Space: If we don’t consider the size of the stack for function calls then O(1) otherwise O(h) where h is the height of the tree.
    func removeShortPathNodes(minPath: Int) {
        root = removeShortPathNodesUtil(node: root, minPath: minPath, level: 1)
    }

    private func removeShortPathNodesUtil(
        node: TreeNode<T>?,
        minPath: Int,
        level: Int
    ) -> TreeNode<T>? {
        guard let node = node else {
            return nil
        }

        node.left = removeShortPathNodesUtil(node: node.left, minPath: minPath, level: level + 1)
        node.right = removeShortPathNodesUtil(node: node.right, minPath: minPath, level: level + 1)

        if node.left == nil, node.right == nil, level < minPath {
            return nil
        }

        return node
    }
}

let tree = Tree<Int>()

tree.root = TreeNode(value: 1)
tree.root?.left = TreeNode(value: 2)
tree.root?.right = TreeNode(value: 3)
tree.root?.left?.left = TreeNode(value: 4)
tree.root?.left?.right = TreeNode(value: 5)
tree.root?.left?.left?.left = TreeNode(value: 7)
tree.root?.right?.right = TreeNode(value: 6)
tree.root?.right?.right?.left = TreeNode(value: 8)

tree.removeShortPathNodes(minPath: 4)

print(tree)
print("Output should be: 7 - 4 - 2 - 1 - 3 - 8 - 6\n")
