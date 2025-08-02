class RLE {
  static encode(s) {
    var result = ""
    var prev = null
    var count = 0
    
    for(c in s) {
      if(c == prev) {
        count = count + 1
      } else {
        if(prev != null) {
           if (count > 1) result = result + count.toString 
           result = result + prev
        }
        count = 1
        prev = c
      }
    }
    if(prev != null) {
       if (count > 1) result = result + count.toString 
       result = result + prev
    }
    return result
  }
  
  static decode(s) {
    var count = 0
    var result = ""
    for(c in s) {
      if(isDigit(c)) {
        count = 10*count + Num.fromString(c)
      } else {
        result = result + (1..(1.max(count))).map{c}.join("")
        count = 0
      }
    }
    return result
  }
  
  static isDigit(char) { "0123456789".contains(char) }
}
