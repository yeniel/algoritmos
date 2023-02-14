<script>
// javascript program to find the smallest positive value that cannot be
// represented as sum of subsets of a given sorted array

    // Returns the smallest number that cannot be represented as sum
    // of subset of elements from set represented by sorted array arr[0..n-1]
    function findSmallest(arr , n)
    {
        var res = 1; // Initialize result

        // Traverse the array and increment 'res' if arr[i] is
        // smaller than or equal to 'res'.
        for (i = 0; i < n && arr[i] <= res; i++)
            res = res + arr[i];

        return res;
    }

    // Driver program to test above functions

        var arr1 = [ 1, 3, 4, 5 ];
        var n1 = arr1.length;
        document.write(findSmallest(arr1, n1)+"<br/>");

        var arr2 = [ 1, 2, 6, 10, 11, 15 ];
        var n2 = arr2.length;
        document.write(findSmallest(arr2, n2)+"<br/>");

        var arr3 = [ 1, 1, 1, 1 ];
        var n3 = arr3.length;
        document.write(findSmallest(arr3, n3)+"<br/>");

        var arr4 = [ 1, 1, 3, 4 ];
        var n4 = arr4.length;
        document.write(findSmallest(arr4, n4)+"<br/>");

// This code is contributed by aashish1995
</script>
