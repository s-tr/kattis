import Data.List
import Data.Char
import Data.Function

{-
	Kattis problem ladder

	Difficulty: 1.3
	Solved:     2018-01-07
-}

computeLine :: String -> String
computeLine line = undefined

solve :: String -> String
solve text = show$ceiling$(a/(sin (b*pi/180)))
             where [a,b] = map read$words text

main :: IO ()
main = interact solve

