BEGIN {
    _PLANT["C"] = "clover"
    _PLANT["G"] = "grass"
    _PLANT["R"] = "radishes"
    _PLANT["V"] = "violets"

    _student_idx = (index ("ABCDEFGHIJKL", substr(name, 1, 1)) -1) * 2
}
{
    for(_i = 1; _i <= 2; _i++)
      _plant[2 * (NR -1) + _i] = _PLANT[substr($0, _student_idx + _i, 1)]
}
END {
    for(_i = 1; _i <=4; _i++)
      printf "%s%s", _plant[_i], (_i < 4 ? OFS : ORS)
}