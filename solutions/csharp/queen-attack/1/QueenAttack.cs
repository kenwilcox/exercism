using System;

public class Queen
{
    public Queen(int row, int column)
    {
        Row = row;
        Column = column;
    }

    public int Row { get; }
    public int Column { get; }
}

public static class QueenAttack
{
    public static bool CanAttack(Queen white, Queen black)
    {
        if (white.Row == black.Row) return true;
        if (white.Column == black.Column) return true;
        return false;
    }

    public static Queen Create(int row, int column)
    {
        if (row < 1) throw new ArgumentOutOfRangeException(nameof(row));
        if (column < 1) throw new ArgumentOutOfRangeException(nameof(column));
        // I don't know why this is invalid...
        //if (column / row == 2) throw new ArgumentOutOfRangeException();
        //if (row / column == 2) throw new ArgumentOutOfRangeException();
        return new Queen(row, column);
    }
}