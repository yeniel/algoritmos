// JavaScript program for the above approach
class Node{
    constructor(data){
        this.data = data;
        this.left = null;
        this.right = null;
    }
}

class QueueObj{
    constructor(node, hd){
        this.node = node;
        this.hd = hd;
    }
}

function topView(root){
    if(root == null) return;

    let q = [];
    let mp = new Map();
    let mn = 0;
    let mx = 0;
    // Level Order Traversal
    q.push(new QueueObj(root, 0));
    while(q.length != 0){
        let curr = q.shift();

        // only include in map if this is the
        // first node of this specific
        // horizontal distance
        if(mp[curr.hd] == null){
            mp[curr.hd] = curr.node.data;
        }

        if(curr.node.left != null){
            // min can be found only in left side due to
            // "-1" minimum horizontal distance of any
            // node from root
            mn = Math.min(mn, curr.hd-1);
            q.push(new QueueObj(curr.node.left, curr.hd-1));
        }

        if(curr.node.right != null){
            // max can be found only in right side due to
            // "+1" maximum horizontal distance of any
            // node from root
            mx = Math.max(mx, curr.hd+1);
            q.push(new QueueObj(curr.node.right, curr.hd+1));
        }
    }
    // traversal of (horizontal distance from rooo)
    // minimum to maximum
    while(mn <= mx){
        console.log(mp[mn]);
        mn++;
    }
}

let root = new Node(1);
root.left = new Node(2);
root.right = new Node(3);
root.left.right = new Node(4);
root.left.right.right = new Node(5);
root.left.right.right.right = new Node(6);
console.log("Following are nodes in top view of Binary Tree");
topView(root);

// This code is contributed by Yash Agarwal(yashagarwal2852002).
