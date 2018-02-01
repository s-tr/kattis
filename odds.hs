import Data.List
import Data.Char
import Data.Function
import Data.Ratio

{-
	Kattis problem odds

	Difficulty: 2.2
	Solved:     2018-01-18
-}

possibles :: Char -> [Int]
possibles '*' = [1..6]
possibles a   = [(ord a)-(ord '0')]

score :: Int -> Int -> Int
score 1 2 = 999
score 2 1 = 999
score a b = if   a==b then 99+a
            else if   a>b then a*10+b
                 else b*10+a

{-
	Returns 1 if player 1 wins, and 0 otherwise
-}
doesWin :: Int -> Int -> Int -> Int -> Int
doesWin a b c d = if (score a b) > (score c d) then 1 else 0

firsts :: [a] -> [a]
firsts (a:_:xs) = a:(firsts xs)
firsts [a]      = [a]
firsts _        = []

computeLine :: String -> String
computeLine line = case (firsts line) of
                       "0000"    -> ""
                       [a,b,c,d] -> if   ratio==1 then "1" 
                                    else if   ratio==0 then "0"
                                         else (show$numerator ratio) ++ "/" ++ (show$denominator ratio)
                           where possible = [ doesWin s0 s1 r0 r1 | 
                                                s0 <- (possibles a),
                                                s1 <- (possibles b),
                                                r0 <- (possibles c),
                                                r1 <- (possibles d)]
                                 ratio = (sum possible) % (length possible)

solve :: String -> String
solve = unlines . map computeLine . lines

main :: IO ()
main = interact solve

