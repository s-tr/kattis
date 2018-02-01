import Data.List
import Data.Char
import Data.Function

{-
	Kattis problem parking2

	Difficulty: 1.5
	Solved:     2018-01-15
-}

seconds :: [a] -> [a]
seconds []       = []
seconds [_]      = []
seconds (_:a:xs) = a:(seconds xs)

computeLine :: String -> String
computeLine line = show $ 2*((maximum ns) - (minimum ns))
                   where ns = (map read $ words line) :: [Integer]

solve :: String -> String
solve = unlines . map computeLine . seconds . tail . lines

main :: IO ()
main = interact solve

