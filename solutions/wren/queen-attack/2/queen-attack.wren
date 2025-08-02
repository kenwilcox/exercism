class QueenAttack {
  construct new() {
    _white = [7,3]
    _black = [0,3]
  }
  construct new(pieces) {
    _white = pieces["white"] || [7,3]
    _black = pieces["black"] || [0,3]

    if (_white[0] < 0 || _white[0] > 7 || _white[1] < 0 || _white[1] > 7) {
      Fiber.abort("Queen must be placed on the board")
    }
    
    if ( _black[0] < 0 || _black[0] > 7 || _black[1] < 0 || _black[1] > 7) {
      Fiber.abort("Queen must be placed on the board")
    } else if (_white[0] == _black[0] && _white[1] == _black[1]){
      Fiber.abort("Queens cannot share the same space")
    }
  }

  toString {
    var result = List.new()
    for (row in 0...8) {
      var line = ""
      for (col in 0...8) {
        if (_black[0] == row && _black[1] == col) {
          line = line + "B "
        } else if (_white[0] == row && _white[1] == col) {
          line = line + "W "
        } else {
          line = line + "_ "
        }
      }
      result.add(line.trimEnd(" "))
    }
    return result.join("\n")
  }

  canAttack {
    if (_white[0] == _black[0] || _white[1] == _black[1]) {
      return true
    }
    if ((_white[0] - _black[0]).abs == (_white[1] - _black[1]).abs) {
      return true
    }
    return false
  }

  white {_white}
  black {_black}
}
