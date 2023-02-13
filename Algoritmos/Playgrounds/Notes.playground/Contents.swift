<script>

    // JavaScript program to remove nodes on
    // root to leaf paths of length < k

    class Node
    {
        constructor(item) {
        this.left = null;
        this.right = null;
        this.data = item;
        }
    }

    let root;

    // Utility method that actually removes the nodes which are not
    // on the pathLen >= k. This method can change the root as well.
    function removeShortPathNodesUtil(node, level, k)
    {
        //Base condition
        if (node == null)
            return null;

        // Traverse the tree in postorder fashion so that if a leaf
        // node path length is shorter than k, then that node and
        // all of its descendants till the node which are not
        // on some other path are removed.
        node.left = removeShortPathNodesUtil(node.left, level + 1, k);
        node.right = removeShortPathNodesUtil(node.right, level + 1, k);

        // If root is a leaf node and it's level is less than k then
        // remove this node.
        // This goes up and check for the ancestor nodes also for the
        // same condition till it finds a node which is a part of other
        // path(s) too.
        if (node.left == null && node.right == null && level < k)
            return null;

        // Return root;
        return node;
    }

    // Method which calls the utility method to remove the short path
    // nodes.
    function removeShortPathNodes(node, k)
    {
        let pathLen = 0;
        return removeShortPathNodesUtil(node, 1, k);
    }

    //Method to print the tree in inorder fashion.
    function printInorder(node)
    {
        if (node != null)
        {
            printInorder(node.left);
            document.write(node.data + " ");
            printInorder(node.right);
        }
    }

    let k = 4;
    root = new Node(1);
    root.left = new Node(2);
    root.right = new Node(3);
    root.left.left = new Node(4);
    root.left.right = new Node(5);
    root.left.left.left = new Node(7);
    root.right.right = new Node(6);
    root.right.right.left = new Node(8);
    document.write("The inorder traversal of Original tree is : " +
    "</br>");
    printInorder(root);
    let res = removeShortPathNodes(root, k);
    document.write("</br>");
    document.write("The inorder traversal of Modified tree is : " +
    "</br>");
    printInorder(res);

</script>

