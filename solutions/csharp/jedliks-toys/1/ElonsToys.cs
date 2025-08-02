using System;

class RemoteControlCar
{
    private int _batteryLevel = 100;
    private int _distance;
    
    public static RemoteControlCar Buy()
    {
        return new RemoteControlCar();
    }

    public string DistanceDisplay()
    {
        return $"Driven {_distance} meters";
    }

    public string BatteryDisplay()
    {
        return _batteryLevel <= 0 ? "Battery empty" : $"Battery at {_batteryLevel}%";
    }

    public void Drive()
    {
        if (_batteryLevel <= 0) return;
        _batteryLevel -= 1;
        _distance += 20;
    }
}
