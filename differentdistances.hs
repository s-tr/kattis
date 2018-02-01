import Data.List
import Data.Char
import Data.Function

{-
	Kattis problem name

	Difficulty: 1.5
	Solved:     2018-01-17
-}

computeLine :: String -> String
computeLine line = case (map read$words line) of
                       [x1,y1,x2,y2,p] -> show$((xd**p+yd**p)**(1/p))
                           where xd = (abs (x1-x2))::Double
                                 yd = abs (y1-y2)
                       _ -> ""

solve :: String -> String
solve = unlines . map computeLine . lines

main :: IO ()
main = interact solve

