import Data.List
import Data.Char
import Data.Function

{-
	Kattis problem ceremony
	Difficulty:    3.8
	Solved:        2017-11-17
-}

computeLine :: String -> String
computeLine = undefined

solve :: String -> String
solve input = let {
                  (bldgs:hs) = map read$words input;
                  corners    = zip [0..bldgs] (reverse (0:(sort hs)))
              } in show$uncurry (+)$minimumBy (compare `on` (uncurry (+))) corners


main :: IO ()
main = interact solve
