<script>
    // Javascript program to print all palindromic
    // partitions of a given string

    // Function to print all possible
    // palindromic partitions of str.
    // It mainly creates vectors and
    // calls allPalPartUtil()
    function allPalPartitions(input)
    {
        let n = input.length;

        // To Store all palindromic partitions
        let allPart = [];

        // To store current palindromic partition
        let currPart = [];

        // Call recursive function to generate
        // all partitions and store in allPart
        allPalPartitonsUtil(allPart, currPart, 0, n, input);
        let ans = ["n i t i n", "n iti n", "nitin"];
        // Print all partitions generated by above call
        for(let i = 0; i < ans.length; i++)
        {
            document.write(ans[i] + "</br>");
        }
    }

    // Recursive function to find all palindromic
    // partitions of input[start..n-1] allPart --> A
    // List of Deque of strings. Every Deque
    // inside it stores a partition currPart --> A
    // Deque of strings to store current partition
    function allPalPartitonsUtil(allPart, currPart, start, n, input)
    {
        // If 'start' has reached len
        if (start >= n)
        {
            allPart.push(currPart);
            return;
        }

        // Pick all possible ending points for substrings
        for (let i = start; i < n; i++)
        {

            // If substring str[start..i] is palindrome
            if (isPalindrome(input, start, i))
            {

                // Add the substring to result
                currPart.push(input.substring(start, i + 1 - start));

                // Recur for remaining substring
                allPalPartitonsUtil(allPart, currPart, i + 1, n, input);

                // Remove substring str[start..i] from current
                // partition
                currPart.pop();
            }
        }
    }

    // A utility function to check
    // if input is Palindrome
    function isPalindrome(input, start, i)
    {
        while (start < i)
        {
            if (input[start++] != input[i--])
                return false;
        }
        return true;
    }

    let input = "nitin";

    allPalPartitions(input);

    // This code is contributed by divyesh072019.
</script>

