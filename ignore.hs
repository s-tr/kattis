import Data.List
import Data.Char
import Data.Function

{-
	Kattis problem ignore

	Difficulty: 3.2
	Solved:     2018-01-23
-}

b7 :: Int -> [Int]
b7 x | x<7 = [x]
     | 2>1 = (x `mod` 7):(b7 (x `div` 7))

digits = "0125986"

toChar :: Int -> Char
toChar = (digits!!)

computeLine :: String -> String
computeLine = map toChar . b7 . read

solve :: String -> String
solve = unlines . map computeLine . lines

main :: IO ()
main = interact solve

