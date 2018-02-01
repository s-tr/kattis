import Data.List
import Data.Char
import Data.Function

{-
	Kattis problem icpcawards

	Difficulty: 1.3
	Solved:     2018-01-07
-}

computeLine :: String -> String
computeLine line = undefined

k :: String -> (String,String)
k x = (head$words x,x)

solve :: String -> String
solve = unlines.take 12.map snd.nubBy((==)`on`fst).map k.tail.lines

main :: IO ()
main = interact solve

