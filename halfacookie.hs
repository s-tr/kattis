import Data.List
import Data.Char
import Data.Function

{-
	Kattis problem name

	Difficulty: 1.8	
	Solved:     2018-01-19
-}

computeLine :: String -> String
computeLine line = let {
                       [r,x,y] = map read$words line;
                       d       = sqrt$ x*x+y*y
                   } in if   d > r then "miss"
                        else let {
                                 theta = acos (d/r);
                                 a1    = r*r*(pi-theta+(sin theta)*(cos theta));
                                 a2    = r*r*(theta-(sin theta)*(cos theta));
                             } in (show a1) ++ " " ++ (show a2)

solve :: String -> String
solve = unlines . map computeLine . lines

main :: IO ()
main = interact solve

