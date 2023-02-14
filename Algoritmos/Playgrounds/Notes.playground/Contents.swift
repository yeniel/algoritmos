<script>

// Recursive Javascript program to
// print lca of two nodes

// A binary tree node
class Node
{
    constructor(item)
    {
        this.data = item;
        this.left = null;
        this.right = null;
    }
}

var root = null;

/* Function to find LCA of n1 and n2.
The function assumes that both
n1 and n2 are present in BST */
function lca(root, n1, n2)
{
    while (root != null)
    {

        // If both n1 and n2 are smaller than
        // root, then LCA lies in left
        if (root.data > n1 && root.data > n2)
            root = root.left;

        // If both n1 and n2 are greater than
        // root, then LCA lies in right
        else if (root.data < n1 && root.data < n2)
            root = root.right;

        else break;
    }
    return root;
}

// Driver code

// Let us construct the BST shown
// in the above figure
root = new Node(20);
root.left = new Node(8);
root.right = new Node(22);
root.left.left = new Node(4);
root.left.right = new Node(12);
root.left.right.left = new Node(10);
root.left.right.right = new Node(14);

var n1 = 10, n2 = 14;
var t = lca(root, n1, n2);
document.write("LCA of " + n1 + " and " + n2 +
            " is " + t.data + "<br>");

n1 = 14;
n2 = 8;
t = lca(root, n1, n2);
document.write("LCA of " + n1 + " and " + n2 +
            " is " + t.data+ "<br>");

n1 = 10;
n2 = 22;
t = lca(root, n1, n2);
document.write("LCA of " + n1 + " and " + n2 +
            " is " + t.data+ "<br>");

// This code is contributed by rrrtnx

</script>
