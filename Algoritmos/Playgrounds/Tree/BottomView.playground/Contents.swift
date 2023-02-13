import UIKit

extension Tree {
    // Time Complexity: O(N * logN)
    // Auxiliary Space: O(N)
    func bottomView() -> [T] {
        guard let root = root else {
            return []
        }

        var horizontalDistance = 0
        var map: [Int: T] = [:]
        var queue: [TreeNode<T>] = []

        root.horizontalDistance = horizontalDistance
        queue.append(root)

        while !queue.isEmpty {
            let temp: TreeNode = queue.removeFirst()

            horizontalDistance = temp.horizontalDistance
            map[horizontalDistance] = temp.value

            if let left = temp.left {
                left.horizontalDistance = horizontalDistance - 1
                queue.append(left)
            }

            if let right = temp.right {
                right.horizontalDistance = horizontalDistance + 1
                queue.append(right)
            }
        }

        return map.sorted(by: { $0.key < $1.key }).map { $0.value }
    }

    // Time Complexity: O(N * logN) the extra logN factor is for accessing map
    // Auxiliary Space: O(N)
    func bottomViewBFS() -> [T] {
        var map: [Int: (value: T, level: Int)] = [:]

        bottomViewBFSUtil(node: root, map: &map, horizontalDistance: 0, level: 0)

        return map.sorted(by: { $0.key < $1.key }).map { $0.value.value }
    }

    private func bottomViewBFSUtil(
        node: TreeNode<T>?,
        map: inout [Int: (value: T, level: Int)],
        horizontalDistance: Int,
        level: Int
    ) {
        guard let node = node else {
            return
        }

        if map.keys.contains(horizontalDistance) {
            if let horizontalDistanceLevel = map[horizontalDistance]?.level,
                level >= horizontalDistanceLevel
            {
                map[horizontalDistance] = (node.value, level)
            }
        } else {
            map[horizontalDistance] = (node.value, level)
        }

        bottomViewBFSUtil(
            node: node.left,
            map: &map,
            horizontalDistance: horizontalDistance - 1,
            level: level + 1
        )
        bottomViewBFSUtil(
            node: node.right,
            map: &map,
            horizontalDistance: horizontalDistance + 1,
            level: level + 1
        )
    }

    // Time Complexity: O(N )
    // Auxiliary Space: O(N)
    func bottomViewUnorderedMap() -> [T] {
        guard let root = root else {
            return []
        }

        var result: [T] = []
        var hash: [Int: T] = [:]
        var leftMost = 0
        var queue: [(node: TreeNode<T>?, verticalIndex: Int)] = []

        queue.append((root, 0))

        while !queue.isEmpty {
            let top = queue.removeFirst()
            let temp = top.node
            let verticalIndex = top.verticalIndex

            hash[verticalIndex] = temp?.value
            leftMost = Swift.min(verticalIndex, leftMost)

            if let left = temp?.left {
                queue.append((node: left, verticalIndex: verticalIndex - 1))
            }

            if let right = temp?.right {
                queue.append((node: right, verticalIndex: verticalIndex + 1))
            }
        }

        for i in leftMost..<hash.count {
            if hash.keys.contains(i), let value = hash[i] {
                result.append(value)
            }
        }

        return result
    }
}

let tree = Tree<Int>()
var result: [Int]

tree.root = TreeNode(value: 20)
tree.root?.left = TreeNode(value: 8)
tree.root?.right = TreeNode(value: 22)
tree.root?.left?.left = TreeNode(value: 5)
tree.root?.left?.right = TreeNode(value: 3)
tree.root?.right?.left = TreeNode(value: 4)
tree.root?.right?.right = TreeNode(value: 25)
tree.root?.left?.right?.left = TreeNode(value: 10)
tree.root?.left?.right?.right = TreeNode(value: 14)

result = tree.bottomView()
print(result)
print("Output should be: [5, 10, 4, 14, 25]\n")

result = tree.bottomViewBFS()
print(result)
print("Output should be: [5, 10, 4, 14, 25]\n")

result = tree.bottomViewUnorderedMap()
print(result)
print("Output should be: [5, 10, 4, 14, 25]\n")
