<script>

// JavaScript program to sort an array
// in Zig-Zag form

// Program for zig-zag conversion of array
function zigZag(arr, n)
{

    // Flag true indicates relation "<"
    // is expected, else ">" is expected.
    // The first expected relation is "<"
    let flag = true;

    for(let i = 0; i <= n - 2; i++)
    {

        // "<" relation expected
        if (flag)
        {

            // If we have a situation like A > B > C,
            // we get A > C < B by swapping B and C
            if (arr[i] > arr[i + 1])
                temp = arr[i];
                arr[i] = arr[i + 1];
                arr[i + 1] = temp;
        }

        // ">" relation expected
        else
        {

            // If we have a situation like A < B < C,
            // we get A < C > B by swapping B and C
            if (arr[i] < arr[i + 1])
                temp = arr[i];
                arr[i] = arr[i + 1];
                arr[i + 1] = temp;
        }

        // Flip flag
        flag = !flag;
    }
}

// Driver code
let arr = [ 4, 3, 7, 8, 6, 2, 1 ];
let n = arr.length;
zigZag(arr, n);

for(let i = 0; i < n; i++)
    document.write(arr[i] + " ");

// This code is contributed by Surbhi Tyagi.

</script>
