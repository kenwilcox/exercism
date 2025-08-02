using System;

public static class Darts
{
    public static int Score(double x, double y)
    {
       var hypt = Math.Sqrt(Math.Pow(x, 2) + Math.Pow(y, 2));
       switch(hypt) {
           case var val when hypt > 10: return 0;
           case var val when hypt > 5: return 1;
           case var val when hypt > 1: return 5;
           default: return 10;
       }

    }
}
