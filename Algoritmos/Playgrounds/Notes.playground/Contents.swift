<script>

// Utility functions to find minimum
// and maximum of two elements
function min( x, y) { return (x < y)? x : y; }
function max( x, y) { return (x > y)? x : y; }

// Returns length of the longest
// contiguous subarray
function findLength( arr, n)
{
    let max_len = 1; // Initialize result
    for (let i=0; i<n-1; i++)
    {
        // Initialize min and max for all
        // subarrays starting with i
        let mn = arr[i], mx = arr[i];

        // Consider all subarrays starting
        // with i and ending with j
        for (let j=i+1; j<n; j++)
        {
            // Update min and max in this
            // subarray if needed
            mn = min(mn, arr[j]);
            mx = max(mx, arr[j]);

            // If current subarray has all
            // contiguous elements
            if ((mx - mn) == j-i)
                max_len = Math.max(max_len, mx-mn+1);
        }
    }
    return max_len; // Return result
}


    // driver code

    let arr = [1, 56, 58, 57, 90, 92, 94, 93, 91, 45];
    let n = arr.length;
    document.write("Length of the longest contiguous subarray is "
        + findLength(arr, n));

</script>
