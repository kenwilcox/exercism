# Please implement your solution to binary-search-tree in this file
class Node
  @value : Int32
  @left : Node | Nil = nil
  @right : Node | Nil = nil
  
  def initialize(@value)
  end

  def insert(value)
    left = @left
    right = @right
    if value <= @value
      if left.nil?
        @left = Node.new(value)
      else
        left.insert(value)
      end
    else
      if right.nil?
        @right = Node.new(value)
      else
        right.insert(value)
      end
    end
  end

  def sort : Array(Int32)
    result = [] of Int32
    left = @left
    unless left.nil?
      result.concat(left.sort)
    end
    result << @value
    right = @right
    unless right.nil?
      result.concat(right.sort)
    end
    result
  end

  def value
    @value
  end

  def left
    @left
  end

  def right
    @right
  end
end