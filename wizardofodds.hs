import Data.List
import Data.Char
import Data.Function

{-
	Kattis problem wizardofodds

	Difficulty: 2.8
	Solved:     2018-01-29
-}

computeLine :: String -> String
computeLine line = undefined

solve :: String -> String
solve line = if a<=2^b then "Your wish is granted!" else "You will become a flying monkey!"
                where [a,b] = map read$words line

main :: IO ()
main = interact solve

