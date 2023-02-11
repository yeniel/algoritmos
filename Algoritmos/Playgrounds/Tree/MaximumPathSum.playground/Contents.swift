import UIKit

extension Tree where T: Numeric {
    // Time Complexity: O(N) where N is the number of nodes in the Binary Tree
    // Auxiliary Space: O(N)
    func maximumPathSum() -> T {
        var sum = min

        maximumPathSumUtil(node: root, sum: &sum)

        return sum
    }

    @discardableResult
    func maximumPathSumUtil(node: TreeNode<T>?, sum: inout T) -> T {
        guard let node = node else {
            return neutral
        }

        let leftSum = maximumPathSumUtil(node: node.left, sum: &sum)
        let rightSum = maximumPathSumUtil(node: node.right, sum: &sum)
        let maxSingle = max(max(leftSum, rightSum) + node.value, node.value)
        let maxTop = max(maxSingle, leftSum + rightSum + node.value)

        sum = max(sum, maxTop)

        return maxSingle
    }
}

let tree = Tree<Int>()

tree.root = TreeNode(value: 10)
tree.root?.left = TreeNode(value: 2)
tree.root?.right = TreeNode(value: 10)
tree.root?.left?.left = TreeNode(value: 20)
tree.root?.left?.right = TreeNode(value: 1)
tree.root?.right?.right = TreeNode(value: -25)
tree.root?.right?.right?.left = TreeNode(value: 3)
tree.root?.right?.right?.right = TreeNode(value: 4)

var result = tree.maximumPathSum()

print(result)
print("Output should be: 42\n")
