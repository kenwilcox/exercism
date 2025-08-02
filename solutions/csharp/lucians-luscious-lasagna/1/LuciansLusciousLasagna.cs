class Lasagna
{
    private const int ExpectedMinutes = 40;
    private const int LayerPrepTime = 2;
    
    public int ExpectedMinutesInOven()
    {
        return ExpectedMinutes;
    }
    
    public int RemainingMinutesInOven(int minutesInOven)
    {
        return ExpectedMinutes - minutesInOven;
    }
    
    public int PreparationTimeInMinutes(int layers)
    {
        return layers * LayerPrepTime;
    }
    
    public int ElapsedTimeInMinutes(int layers, int minutesInOven)
    {
        return minutesInOven + PreparationTimeInMinutes(layers);
    }
}
