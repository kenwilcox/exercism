module RnaTranscription exposing (toRNA)
import Dict
pairs : Dict.Dict Char Char
pairs = Dict.fromList [('G', 'C'), ('C', 'G'), ('T', 'A'), ('A', 'U')]

toRNA : String -> Result String String
toRNA =
    String.toList
        >> List.map(\n -> Dict.get n pairs)
        >> List.foldr (Maybe.map2 String.cons) (Just "")
        >> Result.fromMaybe "Invalid input"