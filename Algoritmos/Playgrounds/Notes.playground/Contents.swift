<script>

// JavaScript program to find pair
// with sum closest to x


    // Prints the pair with sum closest to x
    function printClosest(arr,n,x)
    {
    // To store indexes of result pair
        let res_l=0, res_r=0;

        // Initialize left and right indexes
        // and difference between
        // pair sum and x
        let l = 0, r = n-1, diff = Number.MAX_VALUE;

        // While there are elements
        // between l and r
        while (r > l)
        {
            // Check if this pair is closer
            // than the closest pair so far
            if (Math.abs(arr[l] +
                arr[r] - x) < diff)
            {
            res_l = l;
            res_r = r;
            diff = Math.abs(arr[l] + arr[r] - x);
            }

            // If this pair has more sum,
            // move to smaller values.
            if (arr[l] + arr[r] > x)
            r--;
            else // Move to larger values
            l++;
        }

    document.write(
    " The closest pair is "+arr[res_l]+" and "+ arr[res_r]
    );
}


    // Driver program to test above function

        let arr = [10, 22, 28, 29, 30, 40], x = 54;
        let n = arr.length;
        printClosest(arr, n, x);



// This code is contributed by sravan kumar

</script>
