let find haystack needle =
    let rec search left right =
        if left > right then Error "value not in array"
        else let mid = (left+right)/2 in
        match haystack.(mid) with
        | x when x = needle -> Ok mid
        | x when x > needle -> search left (mid-1)
        | x when x < needle -> search (mid+1) right
    in
    search 0 @@ Array.length haystack - 1