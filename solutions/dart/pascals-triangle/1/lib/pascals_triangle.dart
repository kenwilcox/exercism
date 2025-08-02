class PascalsTriangle {
  List<List<int>> rows(int n) {
    var triangle = <List<int>>[];
    for (var i = 1; i <= n; i++) {
      var current = List.filled(i, 1);
      if (i < 3) {
        triangle.add(current);
        continue;
      }

      var above = triangle.last;
      for(var j = 1; j < current.length - 1; j++) {
        current[j] = above[j - 1] + above[j];
      }
      triangle.add(current);
    }
    return triangle;
  }
}
