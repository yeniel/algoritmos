// Node class
class Node {
constructor(key) {
    this.data = key;
    this.hd = Infinity;
    this.left = null;
    this.right = null;
}
}

function printBottomView(root) {
    if (!root) return; //if root is NULL
    let hash = new Map(); // <vertical_index , root->data>
    let leftmost = 0; // to store the leftmost index so that we move from left to right
    let q = new Array(); // pair<Node*,vertical Index> for level order traversal.
    q.push([root, 0]); // push the root and 0 vertical index

    while (q.length) {
        let top = q.shift();
        let temp = top[0], ind = top[1];
        hash.set(ind, temp.data); // store the latest vertical_index(key) -> root->data(value)
        leftmost = Math.min(ind, leftmost); // have the leftmost vertical index
        if (temp.left) q.push([temp.left, ind - 1]); // check if any node of left then go in negative direction
        if (temp.right) q.push([temp.right, ind + 1]); //check if any node of left then go in positive direction
    }
    for (let i = leftmost; i < hash.size; i++) {
        if (hash.has(i)) {
        //Traverse each value in hash from leftmost to
        //positive side till key is available
        process.stdout.write(hash.get(i) + ' ');
        }
    }
}


// Driver code
let root = new Node(20);
root.left = new Node(8);
root.right = new Node(22);
root.left.left = new Node(5);
root.left.right = new Node(3);
root.right.left = new Node(4);
root.right.right = new Node(25);
root.left.right.left = new Node(10);
root.left.right.right = new Node(14);
console.log("Bottom view of the given binary tree:");
printBottomView(root);
