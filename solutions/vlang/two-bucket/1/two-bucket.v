module main

enum BucketId {
  one
  two
}

struct Solution {
  moves        int
  goal_bucket  BucketId
  other_bucket int
}

pub fn measure(capacity_one int, capacity_two int, goal int, start_bucket BucketId) !Solution {
  if goal > capacity_one && goal > capacity_two {
      return error('impossible')
  }

  mut fill1 := 0
  mut fill2 := 0
  mut count := 0
  mut switched := false

  mut bucket1 := capacity_one
  mut bucket2 := capacity_two

  if start_bucket == BucketId.two {
      switched = true
      bucket1, bucket2 = bucket2, bucket1
  }

  for goal !in [fill1, fill2] {
    if fill1 != 0 && bucket2 == goal {
      fill2 = bucket2
    } else if fill1 > 0 && fill2 != bucket2 {
      fill2 += fill1
      fill1 = 0
      if fill2 > bucket2 {
        fill1 = fill2 - bucket2
        fill2 = bucket2
      }
    } else if fill1 == 0 {
      fill1 = bucket1
    } else if fill2 == bucket2 {
      fill2 = 0
    } else if fill1 > 0 && fill2 == 0 && fill1 < bucket2 {
      fill2 = fill1
      fill1 = 0
    }
    count++
    
    if fill1 == 0 && fill2 == bucket2 {
      return error('impossible')
    }
  }

  if switched {
      fill1, fill2 = fill2, fill1
  }
  
  if fill1 == goal {
    return Solution {
      moves: count
      goal_bucket: BucketId.one
      other_bucket: fill2
    }
  }

  return Solution {
      moves: count
      goal_bucket: BucketId.two
      other_bucket: fill1
  }
}
