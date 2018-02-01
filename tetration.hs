import Data.List
import Data.Char
import Data.Function

{-
	Kattis problem tetration

	Difficulty: 2.2
	Solved:     2018-01-18
-}

computeLine :: String -> String
computeLine line = undefined

solve :: String -> String
solve text = show $ x**(1/x)
                 where x = (read text)::Double

main :: IO ()
main = interact solve

