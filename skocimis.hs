import Data.List
import Data.Char
import Data.Function

{-
	Kattis problem skocimis

	Difficulty: 1.5
	Solved:     2018-01-07
-}

computeLine :: String -> String
computeLine line = undefined

solve :: String -> String
solve line = show$max (b-a-1) (c-b-1)
             where [a,b,c] = map read$words line

main :: IO ()
main = interact solve

