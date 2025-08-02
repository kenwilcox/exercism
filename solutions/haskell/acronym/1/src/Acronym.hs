module Acronym (abbreviate) where

import Data.Char (isAlpha, isLower, isSpace, isUpper, toUpper)

c ::(Char, Char) -> String
c (a, b) | not (isAlpha a || a == '\'') && isAlpha b = [toUpper b]
c (a, b) | isLower a && isUpper b = [toUpper b]
c _ = []

abbreviate :: String -> String
abbreviate xs = concatMap c $ zip (" " <> xs) xs
