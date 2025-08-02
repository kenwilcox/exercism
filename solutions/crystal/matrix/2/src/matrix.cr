class Matrix
  @matrix : Array(Array(Int32))

  def initialize(input)
    @matrix = input.split('\n').map { |line|
        line.split(' ').map(&.to_i32)
    }
  end

  def row(index)
    @matrix[index - 1]
  end

  def column(index)
    @matrix.map { |col| col[index - 1] }
  end
end
