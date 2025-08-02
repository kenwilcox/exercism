import gleam/list
import gleam/string

pub type Robot {
  Robot(direction: Direction, position: Position)
}

pub type Direction {
  North
  East
  South
  West
}

pub type Position {
  Position(x: Int, y: Int)
}

pub fn create(direction: Direction, position: Position) -> Robot {
  Robot(direction, position)
}

pub fn move(
  direction: Direction,
  position: Position,
  instructions: String,
) -> Robot {
  let robot = create(direction, position)
  instructions
  |> string.to_graphemes
  |> list.fold(from: robot, with: move_one)
}

fn move_one(robot: Robot, instruction: String) -> Robot {
  case instruction, robot {
    "A", Robot(North, Position(x, y)) -> Robot(North, Position(x, y + 1))
    "A", Robot(East, Position(x, y)) -> Robot(East, Position(x + 1, y))
    "A", Robot(South, Position(x, y)) -> Robot(South, Position(x, y - 1))
    "A", Robot(West, Position(x, y)) -> Robot(West, Position(x - 1, y))
    "R", Robot(North, position) -> Robot(East, position)
    "R", Robot(East, position) -> Robot(South, position)
    "R", Robot(South, position) -> Robot(West, position)
    "R", Robot(West, position) -> Robot(North, position)
    "L", Robot(North, position) -> Robot(West, position)
    "L", Robot(East, position) -> Robot(North, position)
    "L", Robot(South, position) -> Robot(East, position)
    "L", Robot(West, position) -> Robot(South, position)
    _, _ -> robot
  }
}