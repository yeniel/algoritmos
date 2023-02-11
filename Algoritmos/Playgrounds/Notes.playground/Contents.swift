// JAVASCRIPT program to check whether a given BT is full or not
class Queue {
    constructor() {
        this.items = [];
    }

    // add element to the queue
    enqueue(element) {
        return this.items.push(element);
    }

    // remove element from the queue
    dequeue() {
        if(this.items.length > 0) {
            return this.items.shift();
        }
    }

    // view the last element
    peek() {
        return this.items[0];
    }

    // check if the queue is empty
    isEmpty(){
    return this.items.length == 0;
    }

    // the size of the queue
    size(){
        return this.items.length;
    }

    // empty the queue
    clear(){
        this.items = [];
    }
}
// Tree node structure
class Node {
    constructor(item) {
        this.data = item;
        this.left = this.right = null;
    }
}

// helper fun to check leafnode
function isleafnode(root)
{
    if(root.left==null && root.right==null)
        return true;
    return false;

}

// fun checks whether the given BT is a full BT or not
function isFullTree( root)
{
    // if tree is empty
    if (root==null)
        return true;
let q = new Queue();
    q.enqueue(root)
    while (q.size()!=0) {

        root = q.peek();
        q.dequeue();
        // null indicates - not a full BT
        if (root == null)
            return false;

        // if its not a leafnode then the current node
        // should contain both left and right pointers.
        if (isleafnode(root)==false) {
            q.enqueue(root.left);
            q.enqueue(root.right);
        }
    }

    return true;
}

    let root = new Node(1);
    root.left = new Node(2);
    root.right = new Node(3);
    root.left.left = new Node(4);
    root.left.right = new Node(5);

    if (isFullTree(root)== true)
        console.log("The Binary Tree is full");
    else
        console.log("The Binary Tree is not full");

// This code is contributed by garg28harsh.
