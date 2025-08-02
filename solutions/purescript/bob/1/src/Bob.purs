module Bob
  ( hey
  ) where

import Prelude
import Data.String (null, toLower, toUpper, trim)
import Data.String.CodeUnits (takeRight)

isQuestion :: String -> Boolean
isQuestion str = takeRight 1 (trim str) == "?"

isYelling :: String -> Boolean
isYelling str = toUpper str == str && str /= toLower str

hey :: String -> String
hey message | null (trim message) = "Fine. Be that way!"
            | isQuestion message && isYelling message = "Calm down, I know what I'm doing!"
            | isYelling message = "Whoa, chill out!"
            | isQuestion message = "Sure."
            | otherwise = "Whatever."
