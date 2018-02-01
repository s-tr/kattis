import Data.List
import Data.Char
import Data.Function
import Data.Bits

{-
	Kattis problem bits

	Difficulty: 2.7
	Solved:     2018-01-31
-}

p :: Int -> Int
p = popCount

computeLine :: String -> String
computeLine = show . maximum . map (p.read) . tail . inits

solve :: String -> String
solve = unlines . map computeLine . tail . lines

main :: IO ()
main = interact solve

