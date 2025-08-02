class CircularBuffer
  @buffer : Array(Int32)

  def initialize(size : Int32)
    @index = 0
    @size = 0
    @buffer = Array.new(size, 0)
  end

  def read
    if @size == 0
      raise RuntimeError.new("buffer empty")
    else
      x = @buffer[@index]
      @index = (@index + 1) % @buffer.size
      @size -= 1
      x
    end
  end

  def write(value : Int32)
    if @size == @buffer.size
      raise RuntimeError.new("buffer full")
    else
      @buffer[(@index + @size) % @buffer.size] = value
      @size += 1
    end
  end

  def clear
    @index = 0
    @size = 0
  end

  def overwrite(value : Int32)
    if @size == @buffer.size
      @buffer[@index] = value
      @index = (@index + 1) % @buffer.size
    else
      @buffer[(@index + @size) % @buffer.size] = value
      @size += 1
    end
  end
end
