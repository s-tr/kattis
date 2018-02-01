import Data.List
import Data.Char
import Data.Function

{-
	Kattis problem name

	Difficulty: 1.4
	Solved:     2018-01-07
-}

computeLine :: String -> String
computeLine line = undefined

solve :: String -> String
solve t = (show a)++"\n"++(show b)
          where r = read t
                a = pi*r*r
                b = 2*r*r

main :: IO ()
main = interact solve

