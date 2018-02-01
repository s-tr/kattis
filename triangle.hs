import Data.List
import Data.Char
import Data.Function

{-
	Kattis problem name

	Difficulty: 2.4
	Solved:     2018-01-23
-}

computeLine :: String -> String
computeLine line = undefined

solve :: String -> String
solve = unlines . map f . zip [1..] . map read . lines
            where
                g x = ceiling $ ((logBase 10 3)+x*(logBase 10 1.5))
                f (i,n) = "Case " ++ (show i) ++ ": " ++ (show$g n)

main :: IO ()
main = interact solve

