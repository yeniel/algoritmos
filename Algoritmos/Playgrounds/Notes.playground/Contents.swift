<script>
// javascript program to reverse
// alternate levels of a tree
    class Node {
            constructor(val) {
                this.key = val;
                this.left = null;
                this.right = null;
            }
        }
    function preorder(root1, root2 , lvl)
    {

        // Base cases
        if (root1 == null || root2 == null)
            return;

        // Swap subtrees if level is even
        if (lvl % 2 == 0) {
            var t = root1.key;
            root1.key = root2.key;
            root2.key = t;
        }

        // Recur for left and right subtrees
        // (Note : left of root1
        // is passed and right of root2 in first
        // call and opposite
        // in second call.
        preorder(root1.left, root2.right, lvl + 1);
        preorder(root1.right, root2.left, lvl + 1);
    }

    // This function calls preorder()
    // for left and right
    // children of root
    function reverseAlternate(root) {
        preorder(root.left, root.right, 0);
    }

    // Inorder traversal (used to
    // print initial and
    // modified trees)
    function printInorder(root) {
        if (root == null)
            return;
        printInorder(root.left);
        document.write(root.key + " ");
        printInorder(root.right);
    }

    // A utility function to create a new node
    function newNode(key) {
var temp = new Node();
        temp.left = temp.right = null;
        temp.key = key;
        return temp;
    }

    // Driver program to test above functions

var root = newNode('a');
        root.left = newNode('b');
        root.right = newNode('c');
        root.left.left = newNode('d');
        root.left.right = newNode('e');
        root.right.left = newNode('f');
        root.right.right = newNode('g');
        root.left.left.left = newNode('h');
        root.left.left.right = newNode('i');
        root.left.right.left = newNode('j');
        root.left.right.right = newNode('k');
        root.right.left.left = newNode('l');
        root.right.left.right = newNode('m');
        root.right.right.left = newNode('n');
        root.right.right.right = newNode('o');

        document.write("Inorder Traversal of given tree<br\>");
        printInorder(root);

        reverseAlternate(root);

        document.write("<br\><br\>Inorder Traversal of modified tree<br\>");
        printInorder(root);

// This code is contributed by umadevi9616
</script>
