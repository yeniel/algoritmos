class Node
{

    // Utility function to create a new tree Node
    constructor(data)
    {
        this.data = data;
        this.left = this.right = null;
    }
}

class qItem
{
    constructor(node,depth)
    {
        this.node = node;
        this.depth = depth;
    }
}

function minDepth(root)
{

    // Corner Case
    if (root == null)
        return 0;

    // Create an empty queue for
    // level order traversal
    let q = [];

    // Enqueue Root and initialize depth as 1
    let qi = new qItem(root, 1);
    q.push(qi);

    // Do level order traversal
    while (q.length != 0)
    {

        // Remove the front queue item
        qi = q.shift();

        // Get details of the remove item
        let node = qi.node;
        let depth = qi.depth;

        // If this is the first leaf node seen so far
        // Then return its depth as answer
        if (node.left == null && node.right == null)
            return depth;

        // If left subtree is not null,
        // add it to queue
        if (node.left != null)
        {
            qi.node = node.left;
            qi.depth = depth + 1;
            q.push(qi);
        }

        // If right subtree is not null,
        // add it to queue
        if (node.right != null)
        {
            qi.node = node.right;
            qi.depth = depth + 1;
            q.push(qi);
        }
    }
    return 0;
}

// Driver Code

// Let us create binary tree shown
// in above diagram
let root = new Node(1);
root.left = new Node(2);
root.right = new Node(3);
root.left.left = new Node(4);
root.left.right = new Node(5);

document.write(minDepth(root));
