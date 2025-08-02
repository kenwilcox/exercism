//Solution goes in Sources

class Triangle {
    let triangleKind = (Equilateral:"Equilateral", Isosceles:"Isosceles", Scalene:"Scalene", ErrorKind:"ErrorKind")
    var _kind: String
    init(_ a: Double, _ b: Double, _ c: Double) {
        if a <= 0 || b <= 0 || c <= 0 {
            _kind = triangleKind.ErrorKind
        } else if a + b < c || b + c < a || a + c < b {
            _kind = triangleKind.ErrorKind
        } else if a != b && b != c && c != a {
            _kind = triangleKind.Scalene
        } else if a == b && b == c {
            _kind = triangleKind.Equilateral
        } else {
            _kind = triangleKind.Isosceles
        }
    }
    
    var kind: String  {
        _kind
    }
}
