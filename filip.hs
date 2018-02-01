import Data.List
import Data.Char
import Data.Function

{-
	Kattis problem filip

	Difficulty: 1.3
	Solved:     2017-01-08
-}

computeLine :: String -> String
computeLine line = undefined

solve :: String -> String
solve line = show $ ((maximum . map (read.reverse) . words $ line)::Int)

main :: IO ()
main = interact solve

