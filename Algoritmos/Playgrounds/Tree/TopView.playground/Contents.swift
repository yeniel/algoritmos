import UIKit

extension Tree {
    // Time complexity: O(N * log(N)), where N is the number of nodes in the given tree.
    // Auxiliary Space: O(N), As we store nodes in the map and queue.
    func topView() -> [T] {
        guard let root = root else {
            return []
        }

        var queue: [TreeNode<T>] = []
        var map: [Int: T] = [:]
        var horizontalDistance = 0
        var node: TreeNode<T>

        root.horizontalDistance = horizontalDistance
        queue.append(root)

        while !queue.isEmpty, let first = queue.first {
            node = first
            horizontalDistance = node.horizontalDistance

            if !map.keys.contains(horizontalDistance) {
                map[horizontalDistance] = node.value
            }

            if let left = node.left {
                left.horizontalDistance = horizontalDistance - 1
                queue.append(left)
            }

            if let right = node.right {
                right.horizontalDistance = horizontalDistance + 1
                queue.append(right)
            }

            queue.removeFirst()
        }

        return map.sorted(by: { $0.key < $1.key }).map { $0.value }
    }

    // Time Complexity: O(N), where N is the number of nodes in the given binary tree.
    // Auxiliary Space: O(N)
    func topView2() -> [T] {
        guard let root = root else {
            return []
        }

        var queue: [(node: TreeNode<T>, distance: Int)] = []
        var mp: [Int: T] = [:]
        var mn = 0
        var mx = 0
        var result: [T] = []

        queue.append((node: root, distance: 0))

        while !queue.isEmpty {
            let current = queue.removeFirst()

            if !mp.keys.contains(current.distance) {
                mp[current.distance] = current.node.value
            }

            if let left = current.node.left {
                mn = Swift.min(mn, current.distance - 1)
                queue.append((node: left, distance: current.distance - 1))
            }

            if let right = current.node.right {
                mx = max(mx, current.distance + 1)
                queue.append((node: right, distance: current.distance + 1))
            }
        }

        while mn <= mx, let value = mp[mn] {
            result.append(value)
            mn += 1
        }

        return result
    }
}

let tree = Tree<Int>()
var result: [Int]

tree.root = TreeNode(value: 1)
tree.root?.left = TreeNode(value: 2)
tree.root?.right = TreeNode(value: 3)
tree.root?.left?.right = TreeNode(value: 4)
tree.root?.left?.right?.right = TreeNode(value: 5)
tree.root?.left?.right?.right?.right = TreeNode(value: 6)

result = tree.topView()
print(result)
print("Output should be: [2, 1, 3, 6]\n")

result = tree.topView2()
print(result)
print("Output should be: [2, 1, 3, 6]\n")
