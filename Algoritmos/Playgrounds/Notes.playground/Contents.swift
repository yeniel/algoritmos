<script>
    /*
    * Function to generates and prints all sorted arrays from alternate elements of
    * 'A[i..m-1]' and 'B[j..n-1]' If 'flag' is true, then current element is to be
    * included from A otherwise from B. 'len' is the index in output array C. We
    * print output array each time before including a character from A only if
    * length of output array is greater than 0. We try than all possible
    * combinations
    */
    function generateUtil(A , B , C , i , j , m , n , len, flag) {
        if (flag) // Include valid element from A
        {
            // Print output if there is at least one 'B' in output array 'C'
            if (len != 0)
                printArr(C, len + 1);

            // Recur for all elements of A after current index
            for (var k = i; k < m; k++) {
                if (len == 0) {
                    /*
                    * this block works for the very first call to include the first element in the
                    * output array
                    */
                    C[len] = A[k];

                    // don't increment lem as B is included yet
                    generateUtil(A, B, C, k + 1, j, m, n, len, !flag);
                }

                /* include valid element from A and recur */
                else if (A[k] > C[len]) {
                    C[len + 1] = A[k];
                    generateUtil(A, B, C, k + 1, j, m, n, len + 1, !flag);
                }
            }
        }

        /* Include valid element from B and recur */
        else {
            for (var l = j; l < n; l++) {
                if (B[l] > C[len]) {
                    C[len + 1] = B[l];
                    generateUtil(A, B, C, i, l + 1, m, n, len + 1, !flag);
                }
            }
        }
    }

    /* Wrapper function */
    function generate(A , B , m , n) {
        var C = Array(m + n).fill(0);

        /* output array */
        generateUtil(A, B, C, 0, 0, m, n, 0, true);
    }

    // A utility function to print an array
    function printArr(arr , n) {
        for (i = 0; i < n; i++)
            document.write(arr[i] + " ");
        document.write("<br/>");
    }



        var A = [ 10, 15, 25 ];
        var B = [ 5, 20, 30 ];
        var n = A.length;
        var m = B.length;
        generate(A, B, n, m);

// This code contributed by gauravrajput1
</script>
