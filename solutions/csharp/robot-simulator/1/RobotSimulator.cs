using System;
using System.Collections.Generic;

public enum Direction
{
    North,
    East,
    South,
    West
}

public class RobotSimulator
{
    private Direction _direction;
    private int _x;
    private int _y;

    private Dictionary<char, Action> _movements;
    private Dictionary<Direction, Action> _advance;
    private Dictionary<Direction, Direction> _turnRight = 
        new Dictionary<Direction, Direction>()
    {
        {Direction.North, Direction.East},
        {Direction.East, Direction.South},
        {Direction.South, Direction.West},
        {Direction.West, Direction.North}
    };
    private Dictionary<Direction, Direction> _turnLeft = 
        new Dictionary<Direction, Direction>()
    {
        {Direction.North, Direction.West},
        {Direction.East, Direction.North},
        {Direction.South, Direction.East},
        {Direction.West, Direction.South}
    };

    public RobotSimulator(Direction direction, int x, int y)
    {
        _direction = direction;
        _x = x;
        _y = y;

        _advance = new Dictionary<Direction, Action>()
        {
            {Direction.North, () => _y += 1},
            {Direction.East, () => _x += 1},
            {Direction.South, () => _y -= 1},
            {Direction.West, () => _x -= 1}
        };

        _movements = new Dictionary<char, Action>()
        {
            {'A', Advance},
            {'R', TurnRight},
            {'L', TurnLeft}
        };
    }

    public Direction Direction
    {
        get
        {
            return _direction;
        }
    }

    public int X
    {
        get
        {
            return _x;
        }
    }

    public int Y
    {
        get
        {
            return _y;
        }
    }

    public void Move(string instructions)
    {
        foreach (var c in instructions)
        {
            if (_movements.ContainsKey(c))
            {
                _movements[c]();
            }
        }
    }

    public void Advance()
    {
        _advance[_direction]();
    }

    private void TurnRight()
    {
        _direction = _turnRight[_direction];
    }

    private void TurnLeft()
    {
        _direction = _turnLeft[_direction];
    }
}