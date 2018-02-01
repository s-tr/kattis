import Data.List
import Data.Char
import Data.Function

{-
	Kattis problem kemija

	Difficulty: 1.4
	Solved:     2017-01-07
-}

computeLine :: String -> String
computeLine line = undefined

solve :: String -> String
solve []               = []
solve ('a':'p':'a':xs) = 'a':(solve xs)
solve ('e':'p':'e':xs) = 'e':(solve xs)
solve ('i':'p':'i':xs) = 'i':(solve xs)
solve ('o':'p':'o':xs) = 'o':(solve xs)
solve ('u':'p':'u':xs) = 'u':(solve xs)
solve (x:xs)           = x:(solve xs)

main :: IO ()
main = interact solve

