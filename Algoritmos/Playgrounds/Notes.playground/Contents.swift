<script>
// A Simple Javascript program to count triplets with sum smaller
// than a given value
    let arr = [5, 1, 3, 4, 7];

    function countTriplets(n,sum)
    {

        // Sort input array
        arr.sort(function(a,b){return b-a});

        // Initialize result
        let ans = 0;

        // Every iteration of loop counts triplet with
        // first element as arr[i].
        for (let i = 0; i < n - 2; i++)
        {

            // Initialize other two elements as corner elements
            // of subarray arr[j+1..k]
            let j = i + 1, k = n - 1;

            // Use Meet in the Middle concept
            while (j < k)
            {
                // If sum of current triplet is more or equal,
                // move right corner to look for smaller values
                if (arr[i] + arr[j] + arr[k] >= sum)
                    k--;

                // Else move left corner
                else
                {

                    // This is important. For current i and j, there
                    // can be total k-j third elements.
                    ans += (k - j);
                    j++;
                }
            }
        }
        return ans;
    }

    // Driver method to test the above function
    let sum = 12;
    document.write(countTriplets(arr.length, sum));

    // This code is contributed by rag2127
</script>
