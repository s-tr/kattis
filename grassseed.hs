import Data.List
import Data.Char
import Data.Function

{-
	Kattis problem grassseed

	Difficulty: 1.2
	Solved:     2017-01-07
-}

computeLine :: String -> String
computeLine line = undefined

k :: String -> Double
k line = let [a,b] = map read$words line 
         in  a*b

solve :: String -> String
solve text = let (h:_:ls) = lines text
             in  show$(read h)*(sum$map k$ls)

main :: IO ()
main = interact solve

