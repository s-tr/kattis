import Data.List
import Data.Char
import Data.Function

{-
	Kattis problem name

	Difficulty: 0.0
	Solved:     no
-}

computeLine :: String -> String
computeLine line = undefined

solve :: String -> String
solve text = (show a) ++" "++ (show b)
             where (a,b) = maximumBy (compare `on` snd) $ zip [1..] $ map (sum . (map read) . words) $ lines text

main :: IO ()
main = interact solve

