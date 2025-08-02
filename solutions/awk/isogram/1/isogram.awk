{
    _clean = tolower($0)
    gsub(/[- ]/, "", _clean)
    split(_clean, _chars, "")
    for(_i = 1; _i <= length(_chars); _i++)
        _counts[_chars[_i]]++
    print(length(_counts) == length(_chars)) ? "true" : "false"
}