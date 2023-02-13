<script>

    // Function to check if the
    // Pythagorean triplet exists or not
    function checkTriplet(arr , n) {
        var maximum = 0;

        // Find the maximum element
        for (i = 0; i < n; i++) {
            maximum = Math.max(maximum, arr[i]);
        }

        // Hashing array
        var hash = Array(maximum + 1).fill(0);

        // Increase the count of array elements
        // in hash table
        for (i = 0; i < n; i++)
            hash[arr[i]]++;

        // Iterate for all possible a
        for (i = 1; i < maximum + 1; i++) {

            // If a is not there
            if (hash[i] == 0)
                continue;

            // Iterate for all possible b
            for (j = 1; j < maximum + 1; j++) {

                // If a and b are same and there is only one a
                // or if there is no b in original array
                if ((i == j && hash[i] == 1) || hash[j] == 0)
                    continue;

                // Find c
                var val = parseInt( Math.sqrt(i * i + j * j));

                // If c^2 is not a perfect square
                if ((val * val) != (i * i + j * j))
                    continue;

                // If c exceeds the maximum value
                if (val > maximum)
                    continue;

                // If there exists c in the original array,
                // we have the triplet
                if (hash[val] == 1) {
                    return true;
                }
            }
        }
        return false;
    }

    // Driver Code
        var arr = [ 3, 2, 4, 6, 5 ];
        var n = arr.length;
        if (checkTriplet(arr, n))
            document.write("Yes");
        else
            document.write("No");

// This code is contributed by gauravrajput1

</script>
