import Data.List
import Data.Char
import Data.Function

{-
	Kattis problem name

	Difficulty: 1.6
	Solved:     2018-01-17
-}

computeLine :: String -> String
computeLine line = undefined

solve :: String -> String
solve text = show$length$filter (<=t)$scanl1 (+) times
             where [x,y] = lines text
                   [_,t] = map read$words x
                   times = map read$words y

main :: IO ()
main = interact solve

