module Spiral
  ( spiral
  ) where

import Prelude
import Data.List (List(Nil), (..))

plot :: Int -> Int -> Int -> Int
plot r 1 _ = r
plot r c s = s `div` 2 + plot (c - 1) (s `div` 2 - r + 1) (s - 1)

spiral :: Int -> List (List Int)
spiral 0 = Nil
spiral size = do
  row <- 1..size
  pure $ do
    col <- 1..size
    pure $ plot col row (size * 2)
