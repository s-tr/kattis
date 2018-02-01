import Data.List
import Data.Char
import Data.Function

{-
	Kattis problem judgingmoose

	Difficulty: 1.3
	Solved:     2018-01-07
-}

computeLine :: String -> String
computeLine line = undefined

k :: Integer -> Integer -> String
k 0 0 = "Not a moose"
k x y | x>y  = "Odd "++(show$2*x)
      | y>x  = "Odd "++(show$2*y)
      | x==y = "Even "++(show$2*y)

solve :: String -> String
solve text = k a b
             where [a,b] = map read$words text

main :: IO ()
main = interact solve

