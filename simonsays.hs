import Data.List
import Data.Char
import Data.Function
import Data.Maybe

{-
	Kattis problem simonsays

	Difficulty: 1.6
	Solved:     2018-01-15
-}

computeLine :: String -> Maybe String
computeLine ('S':'i':'m':'o':'n':' ':'s':'a':'y':'s':xs) = Just xs
computeLine _ = Nothing

solve :: String -> String
solve = unlines . catMaybes . map computeLine . tail . lines

main :: IO ()
main = interact solve

