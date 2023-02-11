<script>
    // Javascript program to illustrate if a given array can represent
    // a preorder traversal of a BST or not

    let preIndex = 0;

    // We are actually not building the tree
    function buildBST_helper(n, pre, min, max)
    {
        if (preIndex >= n)
            return;

        if (min <= pre[preIndex] && pre[preIndex] <= max) {
            // build node
            let rootData = pre[preIndex];
            preIndex++;

            // build left subtree
            buildBST_helper(n, pre, min, rootData);

            // build right subtree
            buildBST_helper(n, pre, rootData, max);
        }
        // else
        // return NULL;
    }

    function canRepresentBST(arr, N)
    {
        // code here
        let min = Number.MIN_VALUE, max = Number.MAX_VALUE;

        buildBST_helper(N, arr, min, max);

        return preIndex == N;
    }

    let preorder1 = [ 2, 4, 3 ];
    /*
            2
            \
            4
            /
        3

    */
    let n1 = preorder1.length;

    if (canRepresentBST(preorder1, n1))
    document.write("</br>" + "preorder1 can represent BST");
    else
    document.write("</br>" + "preorder1 can not represent BST :(");

    let preorder2 = [ 5, 3, 4, 1, 6, 10 ];
    let n2 = preorder2.length;
    /*
                        5
            /     \
            3         1
            \     / \
            4 6 10

    */
    if (!canRepresentBST(preorder2, n2))
    document.write("</br>" + "preorder2 can represent BST");
    else
    document.write("</br>" + "preorder2 can not represent BST :(");

    let preorder3 = [ 5, 3, 4, 8, 6, 10 ];
    let n3 = preorder3.length;
    /*
                        5
            /     \
            3         8
            \     / \
            4 6 10

    */
    if (canRepresentBST(preorder3, n3))
    document.write("</br>" + "preorder3 can represent BST");
    else
    document.write("</br>" + "preorder3 can not represent BST :(");

// This code is contributed by decode2207.
</script>
