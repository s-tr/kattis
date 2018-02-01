import Data.List
import Data.Char
import Data.Function
import Data.Ratio

{-
	Kattis problem mia

	Difficulty: 2.4
	Solved:     2018-01-23
-}

score :: Int -> Int -> Int
score 1 2 = 999
score 2 1 = 999
score a b = if   a==b then 99+a
            else if   a>b then a*10+b
                 else b*10+a

{-
	Returns 1 if player 1 wins, and 0 otherwise
-}
doesWin :: Int -> Int -> Int -> Int -> String
doesWin a b c d = if   s1>s2 then "Player 1 wins."
                  else if   s2>s1 then "Player 2 wins."
		       else "Tie."
	          where
		      s1 = (score a b)
		      s2 = (score c d)

computeLine :: String -> String
computeLine line = case map read$words line of
                       [0,0,0,0] -> ""
                       [a,b,c,d] -> doesWin a b c d

solve :: String -> String
solve = unlines . map computeLine . lines

main :: IO ()
main = interact solve

