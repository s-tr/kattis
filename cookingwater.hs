import Data.List
import Data.Char
import Data.Function

{-
	Kattis problem cookingwater

	Difficulty: 2.7
	Solved:     2018-01-29
-}

computeLine :: String -> String
computeLine line = undefined

solve :: String -> String
solve text = if ta <= tb then "gunilla has a point" else "edward is right"
                 where
                     ts = map (\line -> let [a,b] = map read$words line in (a,b)) $ tail $ lines text
                     (ta,tb) = foldl (\(a1,b1) (a2,b2) -> (max a1 a2, min b1 b2)) (-999999,999999) ts

main :: IO ()
main = interact solve

