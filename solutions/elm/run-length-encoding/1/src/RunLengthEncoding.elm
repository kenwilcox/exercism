module RunLengthEncoding exposing (decode, encode)


encode : String -> String
encode string = encoder '0' 0 (String.toList string)
encoder : Char -> Int -> List Char -> String
encoder last count characters = 
    case characters of
    [] -> stringify last count
    current :: rest -> 
        if current /= last
        then stringify last count ++ encoder current 1 rest
        else encoder last (count + 1) rest

stringify : Char -> Int -> String
stringify character count =
    case count of
        0 -> ""
        1 -> String.fromChar character
        _ -> String.fromInt count ++ String.fromChar character


decode : String -> String
decode string = decoder 0 (String.toList string)
decoder : Int -> List Char -> String
decoder count characters =
    case characters of
        [] -> ""
        current :: rest ->
            if Char.isDigit current
            then decoder (count * 10 + Char.toCode current - Char.toCode '0') rest
            else String.repeat(max count 1) (String.fromChar current) ++ decoder 0 rest