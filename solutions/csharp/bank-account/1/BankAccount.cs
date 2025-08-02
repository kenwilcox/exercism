using System;

public class BankAccount
{
    private readonly Object _lock = new();
    private decimal balance = 0;
    private bool closed = true;
    
    public void Open()
    {
        balance = 0m;
        closed = false;
    }

    public void Close()
    {
        closed = true;
    }

    public decimal Balance
    {
        get
        {
            if (closed) throw new InvalidOperationException("closed");
            return balance;
        }
    }

    public void UpdateBalance(decimal change)
    {
        lock(_lock)
        {
            balance += change;
        }
    }
}
