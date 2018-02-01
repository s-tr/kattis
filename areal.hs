import Data.List
import Data.Char
import Data.Function

{-
	Kattis problem areal

	Difficulty: 1.5
	Solved:     2018-01-15
-}

computeLine :: String -> String
computeLine line = undefined

solve :: String -> String
solve = show.(4*).sqrt.read

main :: IO ()
main = interact solve

