import Data.List
import Data.Char
import Data.Function

{-
	Kattis problem rationalsequence

	Difficulty: 3.9
	Solved:     2017-12-02
-}

type Pair = (Int,Int)

{-
	findRoot tries to go up top-left for as long as possible.
-}
findRoot :: Pair -> (Pair, Int)
findRoot (x,1) = ((1,1), x-1)
findRoot (x,y) = ((x `mod` y, y), x `div` y)

next :: Pair -> Pair
next (1,1) = (1,2)
next (x,y) = let (root@(r,s), nSteps) = findRoot (x,y)
             in  if   nSteps == 0 then (y,y-x)
                 else if   root == (1,1) then (1, nSteps+2)
                      else (s,(s-r)+nSteps*s)

computeLine :: String -> String
computeLine line = let {
                       [a,b] = words line
                   ;   (c,d) = span (/= '/') b
                   ;   e     = read c
                   ;   f     = read$tail d
                   ;   (g,h) = next (e,f)
                   } in a ++ " " ++ (show g) ++ "/" ++ (show h)

solve :: String -> String
solve = unlines . map computeLine . tail . lines

main :: IO ()
main = interact solve

