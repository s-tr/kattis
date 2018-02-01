import Data.List
import Data.Char
import Data.Function

{-
	Kattis problem name

	Difficulty: 2.1
	Solved:     2017-12-10
-}

computeLine :: String -> String
computeLine ('s':'i':'m':'o':'n':' ':'s':'a':'y':'s':' ':xs) = xs
computeLine _ = ""

solve :: String -> String
solve = unlines . map computeLine . tail . lines

main :: IO ()
main = interact solve

