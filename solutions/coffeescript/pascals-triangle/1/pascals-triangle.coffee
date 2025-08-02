class PascalsTriangle
  rows: (num) ->
    return [] if num == 0

    this.row n for n in [1..num]

  row: (num) ->
    values = [1]
    x = 1;

    for i in [1...num]
      x = x * (num - i) / i
      values.push(x)
      
    values

module.exports = PascalsTriangle
