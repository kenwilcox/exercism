using System;

public static class BinarySearch
{
    public static int Find(int[] input, int value)
    {
        var min = 0;
        var max = input.Length -1;

        while (min<= max)
        {
            var mid =(min + max) / 2;
            if (value == input[mid]) {
                return mid;
            } 
            
            if (value < input[mid]) {
                max = mid - 1;
            } else {
                min = mid + 1;
            }
        }

        return -1;
    }
}