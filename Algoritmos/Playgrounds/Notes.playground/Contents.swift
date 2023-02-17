<script>
// O(n) solution for finding smallest subarray with sum
// greater than x

// Returns length of smallest subarray with sum greater than
// x. If there is no subarray with given sum, then returns
// n+1
function smallestSubWithSum(arr, n, x)
{
    // Initialize current sum and minimum length
    let curr_sum = 0, min_len = n + 1;

    // Initialize starting and ending indexes
    let start = 0, end = 0;
    while (end < n) {
        // Keep adding array elements while current sum
        // is smaller than or equal to x
        while (curr_sum <= x && end < n)
            curr_sum += arr[end++];

        // If current sum becomes greater than x.
        while (curr_sum > x && start < n) {
            // Update minimum length if needed
            if (end - start < min_len)
                min_len = end - start;

            // remove starting elements
            curr_sum -= arr[start++];
        }
    }
    return min_len;
}

/* Driver program to test above function */
let arr1 = [ 1, 4, 45, 6, 10, 19 ];
let x = 51;
let n1 = arr1.length;
let res1 = smallestSubWithSum(arr1, n1, x);
(res1 == n1 + 1) ? document.write("Not possible<br>")
    : document.write(res1 + "<br>");

let arr2 = [ 1, 10, 5, 2, 7 ];
let n2 = arr2.length;
x = 9;
let res2 = smallestSubWithSum(arr2, n2, x);
(res2 == n2 + 1) ? document.write("Not possible<br>")
    : document.write(res2 + "<br>");

let arr3 = [ 1, 11, 100, 1, 0, 200, 3, 2, 1, 250 ];
let n3 = arr3.length;
x = 280;
let res3 = smallestSubWithSum(arr3, n3, x);
(res3 == n3 + 1) ? document.write("Not possible<br>")
    : document.write(res3 + "<br>");

    // This code is contributed by subham348.
</script>
