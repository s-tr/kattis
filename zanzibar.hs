import Data.List
import Data.Char
import Data.Function

{-
	Kattis problem zanzibar

	Difficulty: 1.4
	Solved:     2018-01-07
-}

computeTurtles :: Integer -> [Integer] -> Integer
computeTurtles i (_:0:[]) = i
computeTurtles i (a:b:xs) = (if b>2*a then computeTurtles (i+b-2*a)
                                      else computeTurtles i) $ (b:xs)

computeLine :: String -> String
computeLine = show . computeTurtles 0 . map read . words

solve :: String -> String
solve = unlines.map computeLine.tail.lines

main :: IO ()
main = interact solve

