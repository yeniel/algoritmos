<script>

const MAX = 100

// class for a tree node
class Node{
    constructor(){
        this.key = ' '
        this.left = null
        this.right = null
    }
}

// A utility function to create a new BST node
function newNode(item){
    temp = new Node()
    temp.key = item
    return temp
}

// A utility function to store inorder traversal of tree rooted
// with root in an array arr[]. Note that i is passed as reference
function storeInorder(root, i){
    if (root == null)
        return '$'
    res = storeInorder(root.left, i)
    res += root.key
    res += storeInorder(root.right, i)
    return res
}

// A utility function to store preorder traversal of tree rooted
// with root in an array arr[]. Note that i is passed as reference
function storePreOrder(root, i){
    if (root == null)
        return '$'
    res = root.key
    res += storePreOrder(root.left, i)
    res += storePreOrder(root.right, i)
    return res
}

// This function returns true if S is a subtree of T, otherwise false
function isSubtree(T, S){
    // base cases
    if (S == null)
        return true
    if (T == null)
        return false

    // Store Inorder traversals of T and S in inT[0..m-1]
    // and inS[0..n-1] respectively
    let m = 0
    let n = 0
    let inT = storeInorder(T, m)
    let inS = storeInorder(S, n)

    // If inS[] is not a substring of inT[], return false
    res = true
    if(inT.indexOf(inT) !== -1)
        res = true
    else
        res = false
    if(res == false)
        return res

    // Store Preorder traversals of T and S in preT[0..m-1]
    // and preS[0..n-1] respectively
    m = 0
    n = 0
    let preT = storePreOrder(T, m)
    let preS = storePreOrder(S, n)

    // If preS[] is not a substring of preT[], return false
    // Else return true
    if(preT.indexOf(preS) !== -1)
        return true
    else
        return false
}

// Driver program to test above function

let T = new newNode('a')
T.left = new newNode('b')
T.right = new newNode('d')
T.left.left = new newNode('c')
T.right.right = new newNode('e')

let S = new newNode('a')
S.left = new newNode('b')
S.left.left = new newNode('c')
S.right = new newNode('d')

if (isSubtree(T, S))
    document.write("Yes: S is a subtree of T","</br>")
else
    document.write("No: S is NOT a subtree of T","</br>")

// This code is contributed by shinjanpatra

</script>
