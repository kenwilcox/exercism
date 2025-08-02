module TwoBucket
  enum Bucket
    One
    Two
  end

  struct Result
    property moves, other_bucket, goal_bucket

    def initialize(@moves : UInt32, @other_bucket : UInt32, @goal_bucket : Bucket)
    end
  end

  def self.measure(bucket_one : UInt32, bucket_two : UInt32, goal : UInt32, start_bucket : Bucket)
    b1, b2 = {bucket_one, 0_u32}, {0_u32, bucket_two}
    b1, b2 = b2, b1 if start_bucket == Bucket::Two

    states = {b1 => 1_u32}
    queue = Deque{b1}

    while state = queue.shift?
      count = states[state]
      return Result.new(count, state[1], Bucket::One) if state[0] == goal
      return Result.new(count, state[0], Bucket::Two) if state[1] == goal

      new_count = count + 1

      d12 = {state[0], bucket_two - state[1]}.min
      d21 = {state[1], bucket_one - state[0]}.min

      {
        {0_u32, state[1]}, {bucket_one, state[1]},
        {state[0], 0_u32}, {state[0], bucket_two},
        {state[0] + d21, state[1] - d21},
        {state[0] - d12, state[1] + d12},
      }.each do |new_state|
        if new_state != b2 && !states.has_key?(new_state)
          states[new_state] = new_count
          queue << new_state
        end
      end
    end

    raise ArgumentError.new    
  end
end
