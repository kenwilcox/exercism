class Flatten {
  static flatten(list) {
    var result = []
    for (item in list) {
      if (!item) continue
      
      if (item is Sequence) {
        result = result + flatten(item)
      } else {
        result.add(item)
      }
    }
    return result
  }
}