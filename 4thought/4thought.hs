import Data.List
import Data.Char
import Data.Function

{-
	Kattis problem name

	Difficulty: 2.8
	Solved:     2017-12-11
-}

m:: [(Integer,String)]
m = [(-60,"4 - 4 * 4 * 4"),
     (-16,"4 - 4 - 4 * 4"),
     (-15,"4 / 4 - 4 * 4"),
     (-8,"4 + 4 - 4 * 4"),
     (-7,"4 / 4 - 4 - 4"),
     (-4,"4 / 4 / 4 - 4"),
     (-1,"4 - 4 - 4 / 4"),
     (0,"4 / 4 / 4 / 4"),
     (1,"4 + 4 / 4 - 4"),
     (2,"4 / 4 + 4 / 4"),
     (4,"4 / 4 / 4 + 4"),
     (7,"4 + 4 - 4 / 4"),
     (8,"4 / 4 * 4 + 4"),
     (9,"4 / 4 + 4 + 4"),
     (15,"4 * 4 - 4 / 4"),
     (16,"4 + 4 + 4 + 4"),
     (17,"4 * 4 + 4 / 4"),
     (24,"4 * 4 + 4 + 4"),
     (32,"4 * 4 + 4 * 4"),
     (60,"4 * 4 * 4 - 4"),
     (68,"4 + 4 * 4 * 4"),
     (256,"4 * 4 * 4 * 4")]

computeLine :: String -> String
computeLine line = let g = (read line)::Integer
                   in  case (lookup g m) of
                         Nothing -> "no solution"
                         Just e  -> e ++ " = " ++ line

solve :: String -> String
solve = unlines . map computeLine . tail . lines

main :: IO ()
main = interact solve
