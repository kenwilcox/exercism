class Minesweeper
  def initialize(@board : Array(String))
  end

  def annotate
    @board.map_with_index do | line, row |
      line.chars.map_with_index do | cell, col |
        cell.to_s.tr(" ", mines_at(row, col))
      end.join
    end
  end

  private def mines_at(row, col) : String
    ([row - 1, 0].max..[row + 1, @board.size - 1].min).sum do | r | 
      ([col - 1, 0].max..[col + 1, @board[0].size - 1].min).count do | c | 
        @board[r][c] == '*'
      end
    end.to_s.tr("0", " ")
  end
end
