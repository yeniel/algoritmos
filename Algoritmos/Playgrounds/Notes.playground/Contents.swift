    function minDifference(arr , n) {
        var sum = 0;
        for (var i = 0; i < n; i++)
            sum += arr[i];
        var y = parseInt(sum / 2) + 1;

        // dp[i] gives whether is it possible to get i as
        // sum of elements dd is helper variable we use dd
        // to ignoring duplicates
        var dp = Array(y).fill(false), dd = Array(y).fill(false);

        // Initialising dp and dd
        for (var i = 0; i < y; i++) {
            dp[i] = dd[i] = false;
        }

        // sum = 0 is possible
        dp[0] = true;// let dp array is used for storing
                  // previous values and dd array is used to
                  // store current values
        for ( var i = 0; i < n; i++)
        {

            // updating dd[k] as true if k can be formed
            // using elements from 1 to i+1
            for (var j = 0; j + arr[i] < y; j++) {
                if (dp[j])
                    dd[j + arr[i]] = true;
            }

            // updating dd
            for (var j = 0; j < y; j++) {
                if (dd[j])
                    dp[j] = true;
                dd[j] = false; // reset dd
            }
        }

        // checking the number from sum/2 to 1 which is
        // possible to get as sum
        for (var i = y - 1; i >= 0; i--) {
            if (dp[i])
                return (sum - 2 * i);
            // since i is possible to form then another
            // number is sum-i so mindifference is sum-i-i
        }
        return 0;
    }

        var arr = 	;
        var n = arr.length;
        document.write("The Minimum difference of 2 sets is " + minDifference(arr, n) + '\n');
